import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? id;
  String title;

  CategoryModel({
    this.id,
    required this.title,
  });

  Map<String, dynamic> toSnapshot() {
    return {
      'title': title,
    };
  }

  CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        title = doc.data()!["title"];

  String toJson() => json.encode(toSnapshot());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromSnapshot(json.decode(source));
}
