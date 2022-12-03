import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pos/models/products_model.dart';

class ProductsLogic {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

// ! add new product
  Future<void> addStock(ProductModel productModel) async {
    _products.add(productModel.toSnapshot());
  }

  // ! get all products

  Future<List<ProductModel>> getAllProduct() async {
    QuerySnapshot<Map<String, dynamic>> snapshots =
        await FirebaseFirestore.instance.collection("products").get();

    return snapshots.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  // ! delete a product

  Future<void> deleteProduct(String id) async {
    await _products.doc(id).delete();
  }

  // ! update a product

  Future<void> updateProduct(String id, ProductModel productModel) async {
    await _products.doc(id).update(productModel.toSnapshot());
  }
}
