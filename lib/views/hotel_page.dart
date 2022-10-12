import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../load_hotel_info.dart';

class HotelPage extends StatefulWidget {
  final uuid;
  static const routeName = '/hotel';
  const HotelPage({super.key, this.uuid});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
     /* final arguments = ModalRoute.of(context)?.settings.arguments as Map; */
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: FutureBuilder(future: infoHotel('https://run.mocky.io/v3/${widget.uuid}'),
      builder: (context, snapshot){
        if (snapshot.hasError) {
                return Center(child:Text(snapshot.error.toString()));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return ListTile(title: Text("${snapshot.data}"));
              }
              if (snapshot.connectionState == ConnectionState.active) {
                return SafeArea(child: Text("${snapshot.data}"));
              }
              return Container();
      }),
    );
  }
}
