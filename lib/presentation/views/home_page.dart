import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pry_api_rest/presentation/viewmodels/product_viewmodel.dart';
import 'package:pry_api_rest/presentation/widgets/base_button.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProductViewmodel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Productos")),
      body: vm.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: vm.products.length,
        itemBuilder: (_, i) {
          final p = vm.products[i];
          return ListTile(
            title: Text(p.name),
            subtitle: Text("Precio: \$${p.price}"),
          );
        },
      ),
      floatingActionButton: BaseButton(
        pressFunction: () {

        },
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.add),
      )
    );
  }
}
