import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pos/models/products_model.dart';

class ProductsLogic {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  Future<void> addStock(ProductModel productModel) async {}
}
