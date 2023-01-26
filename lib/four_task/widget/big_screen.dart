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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          showPopover(
                            context: context,
                            bodyBuilder: (context) => const Text('ddd'),
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
                                  foregroundImage: NetworkImage(
                                      snapshot.data![index].poster),
                                ),
                              ),
                              Text(snapshot.data![index].name),
                              Text(snapshot.data![index].telephone)
                            ],
                          ),
                        ),
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
