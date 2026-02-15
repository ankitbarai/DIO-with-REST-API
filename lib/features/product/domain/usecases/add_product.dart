import '../entity/product.dart';
import '../repositories/poduct_repository.dart';

class AddProduct {
  final ProductRepository repository;

  AddProduct(this.repository);

  Future<void> call(Product product) {
    return repository.addProduct(product);
  }
}
