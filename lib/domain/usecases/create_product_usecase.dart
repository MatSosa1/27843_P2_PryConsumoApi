import 'package:pry_api_rest/data/repositories/base_repository.dart';
import 'package:pry_api_rest/domain/entities/product.dart';

class CreateProductUsecase {
  final BaseRepository _repo;

  CreateProductUsecase(this._repo);

  Future<Product> call(Product p) {
    return _repo.createProduct(p);
  }
}
