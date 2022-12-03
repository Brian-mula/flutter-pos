import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/logic/products/category_logic.dart';
import 'package:pos/models/category_model.dart';

final categoryProvider = Provider<Category>((ref) {
  return Category();
});

final allCategories = FutureProvider<List<CategoryModel>>((ref) {
  return ref.read(categoryProvider).getAllCategories();
});
