import 'package:clean_demo/core/remote/failure.dart';
import 'package:clean_demo/features/dashboard/domain/entities/products_entities.dart';
import 'package:clean_demo/features/dashboard/domain/repository/products_repository.dart';
import 'package:dartz/dartz.dart';

class GetProductsUseCase {
  final ProductRepository repository;
  GetProductsUseCase(this.repository);

  Future<Either<Failure, ProductResponseEntities>> call() {
    return repository.getProducts();
  }
}
