// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';

import '../style/style_text.dart';

class GridViewHotel extends StatefulWidget {
  final poster;
  final name;
  final uuid;
  const GridViewHotel({super.key, this.poster, this.name, this.uuid});

  @override
  State<GridViewHotel> createState() => _GridViewHotelState();
}

class _GridViewHotelState extends State<GridViewHotel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                "assets/images/${widget.poster}",
                fit: BoxFit.fitWidth,
                height: 120,
              )),
          Center(
              child: Text(
            widget.name,
            textAlign: TextAlign.center,
          )),
          InkWell(
              mouseCursor: SystemMouseCursors.click,
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/hotel/${widget.uuid}', arguments: {
                  'hotel.name': widget.name,
                });
              },
              child: Container(
                height: 30,
                  decoration: BoxDecoration(
                    color: ThemeData.dark().backgroundColor,
                    borderRadius:
                        const BorderRadius.vertical(bottom: Radius.circular(20)),
                  ),
                  child: Center(child:  CustomText(information:'Подробнее', color: ThemeData.light().selectedRowColor)))),
        ],
      ),
    );
  }
}
