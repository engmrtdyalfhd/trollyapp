// lib/domain/entities/product.dart

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String category;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
  });

  @override
  List<Object?> get props => [id, name, description, imageUrl, price, category];
}