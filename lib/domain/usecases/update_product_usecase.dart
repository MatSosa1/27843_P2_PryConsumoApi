import 'package:pry_api_rest/data/repositories/base_repository.dart';
import 'package:pry_api_rest/domain/entities/product.dart';

class UpdateProductUsecase {
  final BaseRepository _repo;

  UpdateProductUsecase(this._repo);

  Future<Product> call(String id, Product p) {
    return _repo.updateProduct(id, p);
  }
}
