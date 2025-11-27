import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pry_api_rest/domain/entities/product.dart';
import 'package:pry_api_rest/presentation/viewmodels/product_viewmodel.dart';

class EditProductDialog extends StatefulWidget {
  final Product? product;

  const EditProductDialog({super.key, this.product});

  @override
  State<EditProductDialog> createState() => _EditProductDialogState();
}

class _EditProductDialogState extends State<EditProductDialog> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController stockCtrl = TextEditingController();
  final TextEditingController categoryCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      nameCtrl.text = widget.product!.name;
      priceCtrl.text = widget.product!.price.toString();
      stockCtrl.text = widget.product!.stock.toString();
      categoryCtrl.text = widget.product!.category;
    }
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    priceCtrl.dispose();
    stockCtrl.dispose();
    categoryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<ProductViewmodel>();
    final isEditing = widget.product != null;

    return AlertDialog(
      title: Center(
        child: Text(isEditing ? 'Editar Producto' : 'Agregar Nuevo Producto'),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: priceCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Precio',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: stockCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Stock',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: categoryCtrl,
              decoration: InputDecoration(
                labelText: 'Categoría',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: () {
            final newProduct = Product(
              id: isEditing ? widget.product!.id : '',
              name: nameCtrl.text,
              price: double.tryParse(priceCtrl.text) ?? 0.0,
              stock: int.tryParse(stockCtrl.text) ?? 0,
              category: categoryCtrl.text,
            );

            if (isEditing) {
              vm.modificarProducto(widget.product!.id, newProduct);
            } else {
              vm.agregarProducto(newProduct);
            }
            
            Navigator.pop(context);
          },
          child: const Text('Guardar'),
        )
      ],
    );
  }
}