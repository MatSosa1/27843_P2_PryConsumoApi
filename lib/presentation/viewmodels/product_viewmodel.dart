import 'package:pry_api_rest/domain/entities/product.dart';
import 'package:pry_api_rest/domain/usecases/create_product_usecase.dart';
import 'package:pry_api_rest/domain/usecases/delete_product_usecase.dart';
import 'package:pry_api_rest/domain/usecases/get_products_usecase.dart';
import 'package:pry_api_rest/domain/usecases/update_product_usecase.dart';
import 'package:pry_api_rest/presentation/viewmodels/base_viewmodel.dart';

class ProductViewmodel extends BaseViewmodel {
  final GetProductsUsecase getUseCase;
  final CreateProductUsecase createUseCase;
  final UpdateProductUsecase modifyUseCase;
  final DeleteProductUsecase deleteUseCase;

  List<Product> products = [];

  ProductViewmodel(
    this.getUseCase,
    this.createUseCase,
    this.modifyUseCase,
    this.deleteUseCase
  );

  Future<void> cargarProductos() async {
    setLoading(true);

    products = await getUseCase();

    setLoading(false);
  }

  Future<void> agregarProducto(Product p) async {
    setLoading(true);

    await createUseCase(p);

    setLoading(false);
  }

  Future<void> modificarProducto(String id, Product p) async {
    setLoading(true);

    await modifyUseCase(id, p);

    setLoading(false);
  }

  Future<void> eliminarProducto(String id) async {
    setLoading(true);

    await deleteUseCase(id);

    setLoading(false);
  }
}
