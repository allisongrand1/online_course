import 'package:flutter/material.dart';
import 'package:state_managment/bloc_stream/module_domain/bloc.dart';

class BagProduct extends StatelessWidget {
  const BagProduct({super.key});

  @override
  Widget build(BuildContext context) {
    ProductBLoC productBLoC = ProductBLoC();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Корзина"),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 5,
                child: StreamBuilder(
                    stream: productBLoC.bagList,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                        case ConnectionState.active:
                          return Center(child: CircularProgressIndicator());
                        case ConnectionState.done:
                          if (snapshot.hasError)
                            return Text(
                                'There was an error : ${snapshot.error}');
                          return ListView.separated(
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                  title: Text(snapshot.data![index].title),
                                  subtitle:
                                      Text("${snapshot.data![index].amount}"),
                                  leading: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.network(
                                          snapshot.data![index].image)),
                                  trailing: IconButton(
                                    onPressed: () {
                                      productBLoC.deleteFromBag
                                          .add(snapshot.data![index]);
                                    },
                                    icon: const Icon(Icons.clear),
                                  ));
                            },
                            separatorBuilder: (context, index) => Divider(),
                          );
                      }
                    })),
            /* Expanded(
              flex: 1,
              child: StreamBuilder<double>(
                  stream: productBLoC.outCounter,
                  initialData: 0,
                  builder:
                      (BuildContext context, AsyncSnapshot<double> snapshot) {
                    return Text('${snapshot.data}');
                  }),
            ), */
          ],
        ));
  }
}
