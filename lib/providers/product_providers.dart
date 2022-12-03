import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/logic/products/products_logic.dart';
import 'package:pos/models/products_model.dart';

final products = Provider<ProductsLogic>((ref) {
  return ProductsLogic();
});

final allProducts = FutureProvider<List<ProductModel>>((ref) {
  return ref.read(products).getAllProduct();
});
