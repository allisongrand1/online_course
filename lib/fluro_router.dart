import 'package:fluro/fluro.dart';

import 'views/home_view.dart';
import 'views/hotel_page.dart';


class RouteFluro {
  static FluroRouter router = FluroRouter();

  //обработчик для каждого роута
  static final _homeHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> param) {
    return HomeView();
  });

  static final Handler _artistHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> parametrs) {
    return HotelPage(
      uuid: parametrs['uuid'][0],
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
