// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hotels/style/style_text.dart';
import '../load_hotel_info.dart';
import '../widgets/detailInfoHotel.dart';

class HotelPage extends StatefulWidget {
  final name;
  final uuid;
  static const routeName = '/hotel';
  const HotelPage({super.key, this.uuid, this.name});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Header(
                header: widget.name,
                size: 20,
              )))
        ],
      ),
      body: FutureBuilder(
          future: infoHotel('https://run.mocky.io/v3/${widget.uuid}'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListTile(title: DetailInfoHotel(info: snapshot.data!));
            }
            if (snapshot.connectionState == ConnectionState.active) {
              return SafeArea(child: Text("${snapshot.data}"));
            }
            return Container();
          }),
    );
  }
}
