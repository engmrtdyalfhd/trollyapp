// lib/domain/usecases/get_home_page_data_usecase.dart

import 'package:trollyapp/data/datasources/repositories/product_repository.dart'
    show ProductRepository;

import '../entities/home_page_data.dart';
// import '../repositories/product_repository.dart';
import '../entities/banner.dart'; //قمت انا باضافته
import '../entities/category.dart'; //قمت انا باضافته

class GetHomePageDataUseCase {
  final ProductRepository repository;

  GetHomePageDataUseCase(this.repository);

  Future<HomePageData> call() async {
    // استدعاء الدالتين من الريبوزتوري في نفس الوقت لتحسين الأداء
    final results = await Future.wait([
      repository.getBanners(),
      repository.getCategories(),
    ]);

    // تحويل النتائج إلى النوع الصحيح وإنشاء كائن HomePageData
    final banners = results[0] as List<Banner>;
    final categories = results[1] as List<Category>;

    return HomePageData(banners: banners, categories: categories);
  }
}
