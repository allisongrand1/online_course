import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/four_task/helpers/get_json.dart';
import 'package:multiplatform_solutions/four_task/model/human_model.dart';
import 'package:popover/popover.dart';

class BigScreen extends StatelessWidget {
  const BigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xff39bbc4),
              child: Column(
                children: [
                  Container(
                    height: 90,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xffb7eff3)))),
                    child: const Center(
                        child: Text(
                      "Adaptive App",
                      style: TextStyle(color: Color(0xffb7eff3)),
                    )),
                  ),
                ],
              ),
            )),
        Expanded(
          flex: 5,
          child: FutureBuilder<List<HumanModel>>(
              future: readJson(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  //in case if error found
                  return Center(child: Text("${snapshot.error}"));
                } else if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (_, index) {
                      return PopButton(
                        data: snapshot.data![index],
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ],
    );
  }
}

class PopButton extends StatelessWidget {
  final HumanModel data;
  const PopButton({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showPopover(
          context: context,
          height: 150,
          width: 300,
          backgroundColor: Colors.white,
          bodyBuilder: (context) => ListView(
            children: const [
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Посмотреть профиль'),
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('Посмотреть друзей'),
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text('Сделать репорт данного человека'),
              ),
            ],
          ),
          // ignore: avoid_print
          onPop: () => print('Popover was popped!'),
          direction: PopoverDirection.bottom,
        );
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: CircleAvatar(
                radius: 50,
                foregroundImage: NetworkImage(data.poster),
              ),
            ),
            Text(data.name),
            Text(data.telephone)
          ],
        ),
      ),
    );
  }
}
