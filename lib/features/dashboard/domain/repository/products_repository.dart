import 'package:clean_demo/features/dashboard/domain/entities/products_entities.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/remote/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductResponseEntities>> getProducts();
}
