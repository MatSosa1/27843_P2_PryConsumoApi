import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pry_api_rest/domain/entities/product.dart';
import 'package:pry_api_rest/presentation/viewmodels/product_viewmodel.dart';
import 'package:pry_api_rest/presentation/widgets/edit_product_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProductViewmodel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Tabla de Productos")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (_) => const EditProductDialog()
          );
        },
        child: const Icon(Icons.add),
      ),
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
                        headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                        columns: const [
                          DataColumn(label: Text("Nombre", style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text("Precio", style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text("Stock", style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text("Categoría", style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text("Acciones", style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                        rows: vm.products.map((p) {
                          return DataRow(
                            cells: [
                              DataCell(Text(p.name)),
                              DataCell(Text("\$${p.price}")),
                              DataCell(Text("${p.stock}")),
                              DataCell(Text(p.category)),
                              DataCell(
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit, color: Colors.blue),
                                      onPressed: () {
                                        showDialog(
                                          context: context, 
                                          builder: (_) => EditProductDialog(product: p)
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete, color: Colors.red),
                                      onPressed: () {
                                        _confirmarEliminacion(context, vm, p);
                                      },
                                    ),
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

  void _confirmarEliminacion(BuildContext context, ProductViewmodel vm, Product p) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Confirmar"),
        content: Text("¿Estás seguro de eliminar ${p.name}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              vm.eliminarProducto(p.id);
              Navigator.pop(ctx);
            },
            child: const Text("Eliminar", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}