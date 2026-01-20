// lib/domain/entities/banner.dart

import 'package:equatable/equatable.dart';

class Banner extends Equatable {
  final int id;
  final String imageUrl;

  const Banner({
    required this.id,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, imageUrl];
}