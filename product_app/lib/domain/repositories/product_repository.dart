import 'package:product_app/domain/entities/product.dart';

abstract class ProductRepository {
  Future <List<Product>> getProducts();
}