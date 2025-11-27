import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pry_api_rest/data/datasource/base_datasource.dart';
import 'package:pry_api_rest/data/models/product_model.dart';

class ProductApiDatasource extends BaseDatasource {
  final String baseUrl = 'http://10.0.2.2:3000/api/productos'; 

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final url = Uri.parse(baseUrl);
    final res = await http.get(url);

    if (res.statusCode != 200) {
      throw Exception('Error al obtener productos');
    }

    final List<dynamic> data = json.decode(res.body)['data'];
    return data.map((item) => ProductModel.fromJson(item)).toList();
  }
  
  @override
  Future<ProductModel> createProduct(Map<String, dynamic> jsonData) async {
    final res = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(jsonData)
    );

    if (res.statusCode != 201) {
      throw Exception('Error al crear producto');
    }

    return ProductModel.fromJson(json.decode(res.body));
  }
  
  @override
  Future<bool> deleteProduct(String id) async {
    final res = await http.delete(
      Uri.parse('$baseUrl/$id'),
    );

    return res.statusCode == 200;
  }

  @override
  Future<ProductModel> updateProduct(String id, Map<String, dynamic> data) async {
    final res = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(data)
    );

    if (res.statusCode != 201 && res.statusCode != 200) {
      throw Exception('Error al modificar producto $id');
    }

    return ProductModel.fromJson(json.decode(res.body));
  }
}