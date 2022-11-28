import 'package:cleanarchitecture/module_data/services/user_repository.dart';
import 'package:cleanarchitecture/module_ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

main() {
  final userRepository = UserRepository();
  userRepository.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff3152b7),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}
