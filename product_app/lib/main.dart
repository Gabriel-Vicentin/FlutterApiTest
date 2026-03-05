import 'package:flutter/material.dart';
import 'package:product_app/core/network/client_http.dart';
import 'package:product_app/data/datasources/product_remote_datasource.dart';
import 'package:product_app/data/datasources/product_cache_datasource.dart';
import 'package:product_app/data/repositories/product_repository_impl.dart';
import 'package:product_app/presentation/viewmodels/product_viewmodel.dart';
import 'package:product_app/presentation/pages/product_page.dart';

void main() {
  final client = HttpClient();
  final remote = ProductRemoteDatasource(client);
  final cache = ProductCacheDatasource();
  final repository = ProductRepositoryImpl(remote, cache);
  final viewModel = ProductViewModel(repository);

  runApp(MyApp(viewModel: viewModel));
}

class MyApp extends StatelessWidget {
  final ProductViewModel viewModel;

  const MyApp({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ProductPage(viewModel: viewModel),
    );
  }
}
