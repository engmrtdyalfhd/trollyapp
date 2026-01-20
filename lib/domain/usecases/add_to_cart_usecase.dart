// lib/domain/usecases/add_to_cart_usecase.dart

import 'package:trollyapp/data/datasources/repositories/cart_repository.dart';

import '../entities/cart_item.dart';
// import '../repositories/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<void> call({required CartItem item}) {
    return repository.addToCart(item: item);
  }
}
