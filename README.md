

step 1 => creating productmodel in domain layer to get all products 
step 2 => creating repository contract in domain layer to get all products


abstract class ProductRepository {
Future<List<Product>> getProducts();
Future<void> addProduct(Product product);
}


step 3 => creating usecase in domain layer to get all products