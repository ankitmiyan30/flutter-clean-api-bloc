import 'package:clean_demo/core/remote/failure.dart';
import 'package:clean_demo/features/dashboard/data/datasource/product_data_source.dart';
import 'package:clean_demo/features/dashboard/data/model/product_model.dart';
import 'package:clean_demo/features/dashboard/domain/repository/products_repository.dart';
import 'package:dartz/dartz.dart';

class ProductsRepositoryImpl extends ProductRepository {
  ProductDataSource productDataSource;
  ProductsRepositoryImpl(this.productDataSource);

  @override
  Future<Either<Failure, ProductResponseModel>> getProducts() async {
    try {
      final products = await productDataSource.getProducts();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
