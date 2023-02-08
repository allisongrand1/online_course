import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_firebase/module_bloc/bloc.dart';
import 'package:work_with_firebase/module_ui/src.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create: (BuildContext context) => HomeBloc()),
          BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()),
          BlocProvider<BackgroudBloc>(
              create: (BuildContext context) => BackgroudBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          darkTheme: ThemeData.dark(),
          theme: lightTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => const AuthPage(),
            '/home': (context) => const HomePage(),
          },
        ));
  }
}
