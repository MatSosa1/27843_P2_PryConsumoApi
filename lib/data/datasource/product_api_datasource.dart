import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pry_api_rest/data/datasource/base_datasource.dart';
import 'package:pry_api_rest/data/models/product_model.dart';

class ProductApiDatasource extends BaseDatasource {
  final String baseUrl = 'http://10.0.2.2:3000/api/productos'; 

  @override
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final url = Uri.parse(baseUrl);
      final res = await http.get(url);

      if (res.statusCode != 200) {
        throw Exception('Error al obtener productos: ${res.statusCode}');
      }

      final Map<String, dynamic> jsonResponse = json.decode(res.body);
      final List<dynamic> data = jsonResponse['data'];

      return data.map((item) => ProductModel.fromJson(item)).toList();
    } catch (e) {
      print("Error en fetchProducts: $e");
      throw e;
    }
  }
  
  @override
  Future<ProductModel> createProduct(Map<String, dynamic> jsonData) async {
    try {
      final res = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(jsonData)
      );

      if (res.statusCode != 201) {
        throw Exception('Error al crear: ${res.body}');
      }

      final Map<String, dynamic> jsonResponse = json.decode(res.body);
      return ProductModel.fromJson(jsonResponse['data']);
    } catch (e) {
      print("Error en createProduct: $e");
      throw e;
    }
  }
  
  @override
  Future<bool> deleteProduct(String id) async {
    try {
      final res = await http.delete(Uri.parse('$baseUrl/$id'));
      return res.statusCode == 200;
    } catch (e) {
      print("Error en deleteProduct: $e");
      return false;
    }
  }

  @override
  Future<ProductModel> updateProduct(String id, Map<String, dynamic> data) async {
    try {
      final res = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data)
      );

      if (res.statusCode != 200 && res.statusCode != 201) {
        throw Exception('Error al modificar: ${res.body}');
      }

      final Map<String, dynamic> jsonResponse = json.decode(res.body);
      return ProductModel.fromJson(jsonResponse['data']);
    } catch (e) {
      print("Error en updateProduct: $e");
      throw e;
    }
  }
}