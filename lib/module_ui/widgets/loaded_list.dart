import 'package:work_with_firebase/module_bloc/bloc_state.dart';

import '../../theme/src.dart';

class LoadedList extends StatefulWidget {
  final LoadedHomeState state;
  const LoadedList({super.key, required this.state});

  @override
  State<LoadedList> createState() => _LoadedListState();
}

class _LoadedListState extends State<LoadedList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List>(
        stream: widget.state.products,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            return SizedBox(
              width: 400,
              child: GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Image.network(snapshot.data![index].img),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: AppColors.rose,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    width: 100,
                                    child: Text(
                                      snapshot.data![index].name,
                                      style: lightTheme.textTheme.bodySmall,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: snapshot.data![index].inCart
                                        ? const Icon(Icons.done)
                                        : const Icon(Icons.add_shopping_cart),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            );
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}
