import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/views/hotel_page.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/';
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isGrids = false;
  bool hasError = false;
  bool isLoading = false;
  List<HotelPreview> _hotels = [];
  /* List<HotelUuid> _hotelUuid = []; */
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
      var _response = await Dio()
          .get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      var _data = _response.data;
      _hotels = _data
          .map<HotelPreview>((hotel) => HotelPreview.fromJson(hotel))
          .toList();
          print(_hotels);
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
                icon: Icon(Icons.format_list_bulleted)),
            IconButton(
                onPressed: () => changeView(false),
                icon: Icon(Icons.view_comfy))
          ],
        ),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : hasError == true
                ? Text(errorMessage)
                : Center(
                    child: isGrids == false
                        ? ListView.builder(
                            itemCount: _hotels.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                elevation: 5,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20)),
                                        child: Image.asset(
                                          "assets/images/${_hotels[index].poster}",
                                          fit: BoxFit.cover,
                                          height: 200,
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(_hotels[index].name),
                                        ),
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.of(context).pushNamed(
                                                  '/hotel/${_hotels[index].uuid}',
                                                  arguments: {
                                                    'hotel.name':
                                                        _hotels[index].name,
                                                    'hotel.uuid':
                                                        _hotels[index].uuid
                                                  });
                                            },
                                            child: Text('Подробнее'))
                                      ],
                                    )
                                  ],
                                ),
                              );
                            })
                        : GridView.builder(
                            itemCount: _hotels.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20)),
                                        child: Image.asset(
                                          "assets/images/${_hotels[index].poster}",
                                          fit: BoxFit.fitWidth,
                                          height: 120,
                                        )),
                                    Center(
                                        child: Text(
                                      _hotels[index].name,
                                      textAlign: TextAlign.center,
                                    )),
                                    Column(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).focusColor,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      bottom:
                                                          Radius.circular(20)),
                                            ),
                                            height: 30,
                                            child: GestureDetector(
                                                onTap: () {},
                                                child: Center(
                                                    child: Text('Подробнее')))),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                  ));
  }
}
