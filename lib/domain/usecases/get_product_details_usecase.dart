// lib/domain/usecases/get_product_details_usecase.dart

import 'package:trollyapp/data/datasources/repositories/product_repository.dart';

import '../entities/product.dart';
// import '../repositories/product_repository.dart';

class GetProductDetailsUseCase {
  final ProductRepository repository;

  GetProductDetailsUseCase(this.repository);

  Future<Product> call({required String productId}) {
    return repository.getProductDetails(productId: productId);
  }
}
