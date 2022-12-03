import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String title;

  ProductModel({
    this.id,
    required this.title,
  });

  Map<String, dynamic> toSnapshot() {
    return {
      'title': title,
    };
  }

  ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        title = doc.data()!["title"];

  String toJson() => json.encode(toSnapshot());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromSnapshot(json.decode(source));
}
