// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/widgets/gridView.dart';
import 'package:hotels/widgets/listView.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/';
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isGrids = false;
  bool hasError = false;
  bool isLoading = false;
  List<HotelPreview> _hotels = [];
  String errorMessage = '';

  changeView(bool state) {
    setState(() {
      if (state == true) {
        isGrids = false;
      } else {
        isGrids = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDataDioHotelPreview();
  }

  getDataDioHotelPreview() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await Dio()
          .get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      var data = response.data;
      _hotels = data
          .map<HotelPreview>((hotel) => HotelPreview.fromJson(hotel))
          .toList();
    } on DioError catch (e) {
      setState(() {
        errorMessage = e.response!.statusMessage.toString();
        hasError = true;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => changeView(true),
                icon: const Icon(Icons.format_list_bulleted)),
            IconButton(
                onPressed: () => changeView(false),
                icon: const Icon(Icons.view_comfy))
          ],
        ),
        body: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : hasError == true
                ? Text(errorMessage)
                : Center(
                    child: isGrids == false
                        ? ListView.builder(
                            itemCount: _hotels.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListViewHotel(
                                poster: _hotels[index].poster,
                                name: _hotels[index].name,
                                uuid: _hotels[index].uuid,
                              );
                            })
                        : GridView.builder(
                            itemCount: _hotels.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return GridViewHotel(
                                poster: _hotels[index].poster,
                                name: _hotels[index].name,
                                uuid: _hotels[index].uuid,
                              );
                            })));
  }
}
