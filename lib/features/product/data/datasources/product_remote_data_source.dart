import '../model/product_model.dart';
import 'package:dio/dio.dart';

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource(this.dio);

  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get('/products');

    return (response.data as List)
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }

  Future<void> addProduct(ProductModel product) async {
    await dio.post(
      '/products',
      data: product.toJson(),
    );
  }
}
