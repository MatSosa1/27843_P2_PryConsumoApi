import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pry_api_rest/data/datasource/product_api_datasource.dart';
import 'package:pry_api_rest/data/repositories/product_repository_impl.dart';
import 'package:pry_api_rest/domain/usecases/create_product_usecase.dart';
import 'package:pry_api_rest/domain/usecases/delete_product_usecase.dart';
import 'package:pry_api_rest/domain/usecases/get_products_usecase.dart';
import 'package:pry_api_rest/domain/usecases/update_product_usecase.dart';
import 'package:pry_api_rest/presentation/app_routes.dart';
import 'package:pry_api_rest/presentation/viewmodels/product_viewmodel.dart';

void main() {
  // Inyección de dependencias
  final dataSource = ProductApiDatasource();
  final repo = ProductRepositoryImpl(dataSource);

  final getUsecase = GetProductsUsecase(repo);
  final createUseCase = CreateProductUsecase(repo);
  final updateUseCase = UpdateProductUsecase(repo);
  final deleteUseCase = DeleteProductUsecase(repo);

  runApp(MyApp(
    getUseCase: getUsecase,
    modifyUseCase: updateUseCase,
    createUseCase: createUseCase,
    deleteUseCase: deleteUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final GetProductsUsecase getUseCase;
  final CreateProductUsecase createUseCase;
  final UpdateProductUsecase modifyUseCase;
  final DeleteProductUsecase deleteUseCase;

  const MyApp({
    super.key,
    required this.getUseCase,
    required this.createUseCase,
    required this.modifyUseCase,
    required this.deleteUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductViewmodel(getUseCase, createUseCase, modifyUseCase, deleteUseCase)..cargarProductos()
        ),
      ],
      child: MaterialApp(
        title: "Consumo API Flutter",
        routes: AppRoutes.routes,
      ),
    );
  }
}
