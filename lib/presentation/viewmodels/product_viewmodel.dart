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
    try {
      products = await getUseCase();
    } catch (e) {
      print("Error cargando productos: $e");
    }
    setLoading(false);
  }

  Future<void> agregarProducto(Product p) async {
    setLoading(true);
    try {
      await createUseCase(p);
      await cargarProductos();
    } catch (e) {
      print("Error al agregar: $e");
      setLoading(false);
    }
  }

  Future<void> modificarProducto(String id, Product p) async {
    setLoading(true);
    try {
      await modifyUseCase(id, p);
      await cargarProductos();
    } catch (e) {
      print("Error al modificar: $e");
      setLoading(false);
    }
  }

  Future<void> eliminarProducto(String id) async {
    setLoading(true);
    try {
      await deleteUseCase(id);
      await cargarProductos(); 
    } catch (e) {
      print("Error al eliminar: $e");
      setLoading(false);
    }
  }
}