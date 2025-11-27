import 'package:pry_api_rest/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.stock,
    required super.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['nombre'],
      price: (json['precio'] as num).toDouble(), 
      stock: json['stock'],
      category: json['categoria'],
    );
  }
}