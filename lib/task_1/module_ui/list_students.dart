import 'package:devtools_flutter/task_1/module_data/model.dart';
import 'package:flutter/material.dart';

class ListStudents extends StatefulWidget {
  final List<User> list;
  const ListStudents({super.key, required this.list});

  @override
  State<ListStudents> createState() => _ListStudentsState();
}

class _ListStudentsState extends State<ListStudents> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(widget.list[index].name),
              subtitle: Text(widget.list[index].score),
              leading: Image.network(widget.list[index].poster),
              trailing: IconButton(
                icon: widget.list[index].activist
                    ? const Icon(
                        Icons.star,
                        color: Colors.red,
                      )
                    : const Icon(Icons.star),
                onPressed: () async {
                  setState(() {
                    widget.list[index].activist = !widget.list[index].activist;
                  });
                },
              ));
        });
  }
}
