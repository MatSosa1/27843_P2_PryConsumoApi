import 'package:pry_api_rest/data/datasource/base_datasource.dart';
import 'package:pry_api_rest/data/repositories/base_repository.dart';
import 'package:pry_api_rest/domain/entities/product.dart';

class ProductRepositoryImpl implements BaseRepository {
  final BaseDatasource _datasource;

  ProductRepositoryImpl(this._datasource);

  @override
  Future<List<Product>> getProducts() {
    return _datasource.fetchProducts();
  }
  
  @override
  Future<Product> createProduct(Product p) {
    return _datasource.createProduct({
      'nombre': p.name,
      'precio': p.price,
      'stock': p.price,
      'categoria': p.category
    });
  }
  
  @override
  Future<bool> deleteProduct(String id) {
    return _datasource.deleteProduct(id);
  }
  
  @override
  Future<Product> updateProduct(String id, Product p) {
    return _datasource.updateProduct(
      id,
      {
        'nombre': p.name,
        'precio': p.price,
        'stock': p.price,
        'categoria': p.category
      }
    );
  }
}
