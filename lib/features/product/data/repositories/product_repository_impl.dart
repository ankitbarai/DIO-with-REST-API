import '../../domain/entity/product.dart';
import '../../domain/repositories/poduct_repository.dart';
import '../datasources/product_remote_data_source.dart';
import '../model/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    return await remoteDataSource.getProducts();
  }

  @override
  Future<void> addProduct(Product product) async {
    final model = ProductModel(
      id: product.id,
      title: product.title,
      image: product.image,
    );

    await remoteDataSource.addProduct(model);
  }
}
