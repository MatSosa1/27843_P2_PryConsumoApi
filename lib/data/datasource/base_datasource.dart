import 'package:pry_api_rest/data/models/product_model.dart';

abstract class BaseDatasource {
  Future<List<ProductModel>> fetchProducts();
  Future<ProductModel> createProduct(Map<String, dynamic> data);
  Future<bool> deleteProduct(String id);
  Future<ProductModel> updateProduct(String id, Map<String, dynamic> data);
}
