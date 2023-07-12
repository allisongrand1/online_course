import 'package:flutter/material.dart';
import 'package:presistance_data/task_1/categories.dart';
import 'package:presistance_data/task_1/hive.dart';
import 'package:provider/provider.dart';

class ThirdPage extends StatelessWidget {
  final int idCategories;
  final int idCategory;
  const ThirdPage(this.idCategories, this.idCategory, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Category?>(
          future: context
              .read<HiveDatabase>()
              .getDescriptionOfCategory(idCategories, idCategory),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        snapshot.data!.name,
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Text(
                    snapshot.data!.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              );
            }
            return Container();
          }),
    );
  }
}
