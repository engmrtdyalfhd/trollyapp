// lib/domain/usecases/get_order_history_usecase.dart

import 'package:trollyapp/data/datasources/repositories/order_repository.dart'
    show OrderRepository;

import '../entities/order.dart';
// import '../repositories/order_repository.dart';

class GetOrderHistoryUseCase {
  final OrderRepository repository;

  GetOrderHistoryUseCase(this.repository);

  Future<List<Order>> call() {
    return repository.getOrderHistory();
  }
}
