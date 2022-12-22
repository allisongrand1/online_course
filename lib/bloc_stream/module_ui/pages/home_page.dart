import 'package:flutter/material.dart';
import 'package:state_managment/bloc_stream/module_domain/bloc.dart';

class MyHomePage extends StatelessWidget {
  ProductBLoC productBLoC = ProductBLoC();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Магазин"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/bag');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: StreamBuilder(
          stream: productBLoC.productsList,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError)
                  return Text('There was an error : ${snapshot.error}');
                return ListView.separated(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data![index].title),
                      subtitle: Text("${products[index].amount}"),
                      leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(snapshot.data![index].image)),
                      trailing: IconButton(
                        onPressed: () {
                          productBLoC.addInBag.add(products[index]);
                        },
                        icon: const Icon(Icons.add),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                );
            }
          }),
    );
  }
}
