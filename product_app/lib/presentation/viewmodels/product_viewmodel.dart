import 'package:flutter/foundation.dart';
import 'package:product_app/domain/repositories/product_repository.dart';
import 'package:product_app/presentation/viewmodels/product_state.dart';


class ProductViewModel {
  final ProductRepository repository;
  
  final ValueNotifier <ProductState> state =
    ValueNotifier (const ProductState()) ;
  
  ProductViewModel (this.repository) ;
  
  Future <void> loadProducts() async {
    state.value = state.value.copyWith (isLoading : true);
    try {
      final products = await repository.getProducts ();
      state.value = state.value.copyWith(
        isLoading: false,
        products: products,
      );
  } catch (e) {
      state.value = state.value.copyWith (
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}