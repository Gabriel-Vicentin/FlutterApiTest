import 'package:product_app/domain/entities/product.dart';

class ProductState {
  final bool isLoading;
  final List <Product> products;
  final String? error;

  const ProductState({
    this.isLoading = false,
    this.products = const [],
    this.error,
  });

  ProductState copyWith ({
    bool ? isLoading,
    List <Product>? products,
    String ? error,
  }) {
    return ProductState (
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      error:  error,
    );
  }
}