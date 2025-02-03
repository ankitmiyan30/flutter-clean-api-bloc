// Bloc
import 'package:clean_demo/features/dashboard/domain/usecase/products_usecase.dart';
import 'package:clean_demo/features/dashboard/presentation/bloc/product_event.dart';
import 'package:clean_demo/features/dashboard/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase getProductsUseCase;

  ProductsBloc(this.getProductsUseCase) : super(ProductsInitial()) {
    on<GetProducts>((event, emit) async {
      emit(ProductsLoading());
      final result = await getProductsUseCase();
      result.fold(
        (failure) => emit(ProductsError(failure.message)),
        (products) => emit(ProductsLoaded(products)),
      );
    });
  }
}
