import 'package:pry_api_rest/data/repositories/base_repository.dart';

class DeleteProductUsecase {
  final BaseRepository _repo;

  DeleteProductUsecase(this._repo);

  Future<bool> call(String id) {
    return _repo.deleteProduct(id);
  }
}
