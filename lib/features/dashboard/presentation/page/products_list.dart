import 'package:clean_demo/features/dashboard/presentation/bloc/product_state.dart';
import 'package:clean_demo/features/dashboard/presentation/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProductsLoaded) {
            return ListView.builder(
              itemCount: state.products.products?.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(state.products.products?[index].title ?? ''),
                subtitle: Text(
                    state.products.products?[index].price.toString() ?? ''),
              ),
            );
          }
          return Center(child: Text('No products found.'));
        },
      ),
    );
  }
}
