// lib/domain/repositories/product_repository.dart

import 'package:trollyapp/domain/entities/banner.dart';
import 'package:trollyapp/domain/entities/category.dart';
import 'package:trollyapp/domain/entities/product.dart';

// import '../entities/banner.dart';
// import '../entities/category.dart';
// import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Banner>> getBanners();

  Future<List<Category>> getCategories();

  Future<List<Product>> getProductsByCategory({required String categoryId});

  Future<Product> getProductDetails({required String productId});
}
