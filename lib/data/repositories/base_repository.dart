import 'package:pry_api_rest/domain/entities/product.dart';

abstract class BaseRepository {
  Future<List<Product>> getProducts();
  Future<Product> createProduct(Product p);
  Future<Product> updateProduct(String id, Product p);
  Future<bool> deleteProduct(String id);
}
