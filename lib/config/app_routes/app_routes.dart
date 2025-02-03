import 'package:clean_demo/features/dashboard/data/datasource/product_data_source.dart';
import 'package:clean_demo/features/dashboard/data/repository/products_repository_impl.dart';
import 'package:clean_demo/features/dashboard/domain/usecase/products_usecase.dart';
import 'package:clean_demo/features/dashboard/presentation/bloc/product_event.dart';
import 'package:clean_demo/features/dashboard/presentation/bloc/products_bloc.dart';
import 'package:clean_demo/features/dashboard/presentation/page/products_list.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => ProductsBloc(
          GetProductsUseCase(
            ProductsRepositoryImpl(
              ProductDataSourceImpl(http.Client()),
            ),
          ),
        )..add(
            GetProducts(),
          ),
        child: ProductPage(),
      ),
    ),
  ],
);
