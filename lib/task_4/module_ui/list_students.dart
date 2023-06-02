import 'package:devtools_flutter/task_4/module_data/model.dart';
import 'package:flutter/material.dart';

class ListStudents extends StatefulWidget {
  final List<User> list;
  final bool isNetwork;
  ListStudents({super.key, required this.list, required this.isNetwork});

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
              leading: (widget.isNetwork == true)
                  ? Image.network(
                      widget.list[index].poster,
                      width: 30,
                      height: 30,
                    )
                  : Container(
                      width: 30,
                      height: 30,
                    ),
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
