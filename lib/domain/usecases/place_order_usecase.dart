// lib/domain/usecases/place_order_usecase.dart

import '../../data/datasources/repositories/order_repository.dart';
import '../entities/cart_item.dart';
import '../entities/order.dart';
// import '../repositories/order_repository.dart';

class PlaceOrderUseCase {
  final OrderRepository repository;

  PlaceOrderUseCase(this.repository);

  Future<Order> call({
    required List<CartItem> items,
    required double totalPrice,
  }) {
    return repository.placeOrder(items: items, totalPrice: totalPrice);
  }
}
