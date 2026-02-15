import 'package:flutter/material.dart';

import '../../data/datasources/product_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/entity/product.dart';
import '../../domain/usecases/get_product.dart';
import 'package:dio/dio.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> products = [];

  late GetProducts getProducts;

  @override
  void initState() {
    super.initState();

    final dio = Dio();
    final remote = ProductRemoteDataSource(dio);
    final repo = ProductRepositoryImpl(remote);
    getProducts = GetProducts(repo);
  }

  Future<void> fetchProducts() async {
    final result = await getProducts();
    setState(() {
      products = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: fetchProducts,
            child: Text("Get Names"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(products[index].image),
                  title: Text(products[index].title),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
