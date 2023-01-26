import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/four_task/helpers/get_json.dart';
import 'package:multiplatform_solutions/four_task/model/human_model.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xff39bbc4),
          child: const Center(
              child: Text(
            'Adaptive App',
            style: TextStyle(color: Color(0xffb7eff3)),
          )),
        ),
        Expanded(
            child: FutureBuilder<List<HumanModel>>(
                future: readJson(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () => showModalBottomSheet(
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 150,
                                      child: ListView(
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
                                            title: Text(
                                                'Сделать репорт данного человека'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  context: context),
                              child: Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    foregroundImage: NetworkImage(
                                        snapshot.data![index].poster),
                                  ),
                                  title: Text(snapshot.data![index].name),
                                  subtitle:
                                      Text(snapshot.data![index].telephone),
                                ),
                              ));
                        });
                  }
                  return const Center(child: CircularProgressIndicator());
                }))
      ],
    );
  }
}
