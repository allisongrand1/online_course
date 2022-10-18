// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../style/style_text.dart';

class ListViewHotel extends StatefulWidget {
  final poster;
  final name;
  final uuid;
  const ListViewHotel({super.key, this.poster, this.name, this.uuid});

  @override
  State<ListViewHotel> createState() => _ListViewHotelState();
}

class _ListViewHotelState extends State<ListViewHotel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                "assets/images/${widget.poster}",
                fit: BoxFit.cover,
                height: 200,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(widget.name),
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/hotel/${widget.uuid}', arguments: {
                      'hotel.name': widget.name,
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: ThemeData.dark().backgroundColor,
                        borderRadius:
                            const BorderRadius.only(bottomRight: Radius.circular(20)),
                      ),
                      height: 50,
                      width: 100,
                      child: Center(child: CustomText(information:'Подробнее', color: ThemeData.light().selectedRowColor))))
            ],
          )
        ],
      ),
    );
  }
}
