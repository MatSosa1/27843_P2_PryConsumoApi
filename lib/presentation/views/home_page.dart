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
      appBar: AppBar(title: const Text("Tabla de Productos")),
      body: vm.loading
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.maxWidth),
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text("Nombre")),
                          DataColumn(label: Text("Precio")),
                          DataColumn(label: Text("Acciones")),
                        ],
                        rows: vm.products.map((p) {
                          return DataRow(
                            cells: [
                              DataCell(Text(p.name)),

                              DataCell(Text("\$${p.price}")),

                              DataCell(
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Botón Editar
                                    BaseButton(
                                      pressFunction: (){}, 
                                      backgroundColor: Colors.transparent,
                                      child: Icon(Icons.edit, color: Colors.blue), 
                                    ),
                                    // Botón Eliminar
                                    BaseButton(
                                      pressFunction: (){}, 
                                      backgroundColor: Colors.transparent,
                                      child: Icon(Icons.delete, color: Colors.red), 
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}