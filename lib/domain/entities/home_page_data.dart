// lib/domain/entities/home_page_data.dart

import 'package:equatable/equatable.dart';
import 'banner.dart';
import 'category.dart';

class HomePageData extends Equatable {
  final List<Banner> banners;
  final List<Category> categories;

  const HomePageData({
    required this.banners,
    required this.categories,
  });

  @override
  List<Object?> get props => [banners, categories];
}