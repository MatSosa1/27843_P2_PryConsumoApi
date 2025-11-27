import 'package:pry_api_rest/data/repositories/base_repository.dart';
import 'package:pry_api_rest/domain/entities/product.dart';

class GetProductsUsecase {
  final BaseRepository _repo;

  GetProductsUsecase(this._repo);

  Future<List<Product>> call() {
    return _repo.getProducts();
  }
}
