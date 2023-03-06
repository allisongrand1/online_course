import 'package:devtools_flutter/task_1/module_data/model.dart';
import 'package:flutter/material.dart';

class ListActivist extends StatefulWidget {
  final List<User> list;
  const ListActivist({super.key, required this.list});

  @override
  State<ListActivist> createState() => _ListActivistState();
}

class _ListActivistState extends State<ListActivist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          if (widget.list[index].activist == true) {
            return ListTile(
                title: Text(widget.list[index].name),
                subtitle: Text(widget.list[index].score),
                leading: Image.network(widget.list[index].poster),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ));
          }
          return Container();
        });
  }
}
