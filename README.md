

step 1 => creating productmodel in domain layer to get all products 
step 2 => creating repository contract in domain layer to get all products


abstract class ProductRepository {
Future<List<Product>> getProducts();
Future<void> addProduct(Product product);
}


step 3 => creating usecase in domain layer to get all products

app is not working

i will learn dio tommorow to fetch data from api and then i will implement it in my app