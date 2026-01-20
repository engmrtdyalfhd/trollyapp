// lib/domain/usecases/get_products_by_category_usecase.dart

import 'package:trollyapp/data/datasources/repositories/product_repository.dart';

import '../entities/product.dart';
// import '../repositories/product_repository.dart';

class GetProductsByCategoryUseCase {
  final ProductRepository repository;

  GetProductsByCategoryUseCase(this.repository);

  Future<List<Product>> call({required String categoryId}) {
    return repository.getProductsByCategory(categoryId: categoryId);
  }
}
