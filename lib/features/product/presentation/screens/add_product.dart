import 'package:flutter/material.dart';

import '../../data/datasources/product_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/entity/product.dart';
import '../../domain/usecases/add_product.dart';
import 'package:dio/dio.dart';

class AddProductPage extends StatefulWidget {
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final titleController = TextEditingController();
  final imageController = TextEditingController();

  late AddProduct addProduct;

  @override
  void initState() {
    super.initState();

    final dio = Dio();
    final remote = ProductRemoteDataSource(dio);
    final repo = ProductRepositoryImpl(remote);
    addProduct = AddProduct(repo);
  }

  Future<void> submit() async {
    final product = Product(
      id: 0,
      title: titleController.text,
      image: imageController.text,
    );

    await addProduct(product);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Product Added")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: "Title"),
          ),
          TextField(
            controller: imageController,
            decoration: InputDecoration(labelText: "Image URL"),
          ),
          ElevatedButton(
            onPressed: submit,
            child: Text("Add Product"),
          )
        ],
      ),
    );
  }
}
