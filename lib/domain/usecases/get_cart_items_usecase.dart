// lib/domain/usecases/get_cart_items_usecase.dart

import 'package:trollyapp/data/datasources/repositories/cart_repository.dart';

import '../entities/cart_item.dart';
// import '../repositories/cart_repository.dart';

class GetCartItemsUseCase {
  final CartRepository repository;

  GetCartItemsUseCase(this.repository);

  Future<List<CartItem>> call() {
    return repository.getCartItems();
  }
}
