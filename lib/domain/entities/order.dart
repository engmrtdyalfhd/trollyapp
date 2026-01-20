// lib/domain/entities/order.dart

import 'package:equatable/equatable.dart';
import 'cart_item.dart';

class Order extends Equatable {
  final int id;
  final List<CartItem> items;
  final double totalPrice;
  final String status;
  final DateTime date;

  const Order({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.status,
    required this.date,
  });

  @override
  List<Object?> get props => [id, items, totalPrice, status, date];
}