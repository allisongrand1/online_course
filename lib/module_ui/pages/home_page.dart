import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_firebase/module_bloc/bloc.dart';
import 'package:work_with_firebase/module_bloc/bloc_event.dart';
import 'package:work_with_firebase/module_bloc/bloc_state.dart';
import 'package:work_with_firebase/module_ui/src.dart';
import 'package:work_with_firebase/module_ui/widgets/incart_list.dart';
import 'package:work_with_firebase/module_ui/widgets/loaded_list.dart';
import 'package:work_with_firebase/module_ui/widgets/not_incart_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(SignOutHomeEvent());
                  },
                  icon: Icon(Icons.exit_to_app))
            ],
            title: RichText(
                textDirection: TextDirection.ltr,
                text: const TextSpan(
                  style: TextStyle(
                    color: AppColors.bridalHeath,
                    fontWeight: FontWeight.w300,
                    fontSize: 28,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Yarn",
                    ),
                    TextSpan(
                        text: "Brand",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ))),
        body: Center(
            child: Column(
                crossAxisAlignment: (kIsWeb)
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        'Пряжа',
                        style: lightTheme.textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(
                        width: 130,
                        child: Text(
                          'Ниже представлен список товаров для вязания от известных брендов',
                          style: lightTheme.textTheme.bodyMedium,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton(
                  iconSize: 1,
                  elevation: 3,
                  value: 'None',
                  items: [
                    DropdownMenuItem(
                      value: 'None',
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(LoadedHomeEvent());
                      },
                      child: const Icon(Icons.filter_list),
                    ),
                    DropdownMenuItem(
                      value: 'Done',
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(InCartHomeEvent());
                      },
                      child: const Icon(Icons.done),
                    ),
                    DropdownMenuItem(
                      value: 'Add',
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(NotInCartHomeEvent());
                      },
                      child: const Icon(Icons.add_shopping_cart),
                    )
                  ],
                  onChanged: (_) {},
                ),
              ),
              Expanded(
                flex: 3,
                child:
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  if (state is LoadedHomeState) {
                    return LoadedList(state: state);
                  } else if (state is InCartHomeState) {
                    return InCartList(state: state);
                  } else if (state is NotInCartHomeState) {
                    return NotInCartList(state: state);
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
              )
            ])));
  }
}
