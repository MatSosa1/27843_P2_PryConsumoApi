import 'package:flutter/material.dart';

class EditProductDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Agregar Nuevo Producto'),),
      content: Column(
        spacing: 8,
        children: [
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(
              // labelText: 'Nombre',
              hintText: 'Nombre',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            )
          ),
          TextField(
            controller: priceCtrl,
            decoration: InputDecoration(
              // labelText: 'Nombre',
              hintText: 'Precio',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            )
          ),
          TextField(
            controller: stockCtrl,
            decoration: InputDecoration(
              // labelText: 'Nombre',
              hintText: 'Stock',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            )
          ),
          TextField(
            controller: categoryCtrl,
            decoration: InputDecoration(
              // labelText: 'Nombre',
              hintText: 'Nombre',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            )
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            print("Guardar");
          },
          child: Text('Guardar')
        )
      ],
    );
  }
}
