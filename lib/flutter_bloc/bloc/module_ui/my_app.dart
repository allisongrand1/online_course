import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/flutter_bloc/bloc/module_domain/bloc.dart';
import 'package:state_managment/flutter_bloc/bloc/module_domain/bloc_event.dart';
import 'package:state_managment/flutter_bloc/bloc/module_ui/pages/bag_product.dart';
import 'package:state_managment/flutter_bloc/bloc/module_ui/pages/home_page.dart';

import '../../../theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (BuildContext context) =>
              ProductBloc()..add(const LoadedEvent()),
        ),
        BlocProvider<BagBloc>(
          create: (BuildContext context) => BagBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: basicTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const ShopPage(),
          '/bag': (context) => const BagProduct(),
        },
      ),
    );
  }
}
