import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/flutter_bloc/cubit/module_domain/cubit.dart';
import 'package:state_managment/flutter_bloc/cubit/module_ui/pages/bag_product.dart';
import 'package:state_managment/flutter_bloc/cubit/module_ui/pages/home_page.dart';

import '../../../theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (BuildContext context) => ProductCubit()..loadedProducts(),
        ),
        BlocProvider<BagCubit>(
          create: (BuildContext context) => BagCubit(),
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
