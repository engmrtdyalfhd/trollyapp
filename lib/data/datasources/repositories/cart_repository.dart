// lib/domain/repositories/cart_repository.dart

import 'package:trollyapp/domain/entities/cart_item.dart';

// import '../entities/cart_item.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartItems();

  Future<void> addToCart({required CartItem item});

  Future<void> removeFromCart({required CartItem item});
}
