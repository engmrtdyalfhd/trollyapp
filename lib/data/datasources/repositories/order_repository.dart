// lib/domain/repositories/order_repository.dart

// import '../entities/cart_item.dart';
// import '../entities/order.dart';

import 'package:trollyapp/domain/entities/cart_item.dart';
import 'package:trollyapp/domain/entities/order.dart';

abstract class OrderRepository {
  Future<Order> placeOrder({
    required List<CartItem> items,
    required double totalPrice,
  });

  Future<List<Order>> getOrderHistory();
}
