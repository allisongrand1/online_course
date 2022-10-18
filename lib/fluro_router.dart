import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'pages/home_view.dart';
import 'pages/hotel_page.dart';


class RouteFluro {
  static FluroRouter router = FluroRouter();

  //обработчик для каждого роута
  static final _homeHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> param) {
    return const HomeView();
  });

  static final Handler _artistHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parametrs) {
         final args = ModalRoute.of(context!)!.settings.arguments as Map;
    return HotelPage(
       uuid: parametrs['uuid'][0],
      name: args['hotel.name'],
    );
  });

  // задефайним (определим) роуты
  static void setupRouter() {
    router.define(HomeView.routeName,
        handler: _homeHandler, transitionType: TransitionType.fadeIn);
    router.define('${HotelPage.routeName}/:uuid',
        handler: _artistHandler, transitionType: TransitionType.inFromRight);
  }
}
