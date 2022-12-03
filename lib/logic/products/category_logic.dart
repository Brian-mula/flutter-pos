import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pos/models/category_model.dart';

class Category {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _category =
      FirebaseFirestore.instance.collection('category');
// ! add new category
  Future<void> addCategory(CategoryModel categoryModel) async {
    _category.add(categoryModel.toSnapshot());
  }

  // ! get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection("categories").get();
    return snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
  }

  // !delete a category

  Future<void> deleteCategory(String id) async {
    await _category.doc(id).delete();
  }

  // ! update a category
  Future<void> updateCategory(String id, CategoryModel categoryModel) async {
    await _category.doc(id).update(categoryModel.toSnapshot());
  }
}
