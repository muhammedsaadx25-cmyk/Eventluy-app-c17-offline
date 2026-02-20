import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel {
  String id;
  String ownerId;
  CategoryModel category;
  String title;
  String description;
  DateTime dateTime;


  EventModel(
      {required this.ownerId,required this.id,required this.category, required this.title, required this.description, required this.dateTime});

  EventModel.fromJson(Map<String, dynamic> json) : this(
    id: json["id"],
    ownerId: json["ownerId"],
    category: CategoryModel.categories.firstWhere((category) =>
    category.id == json["categoryId"]),

    title: json["title"],
    description: json["description"],
    dateTime: (json["dateTime"]as Timestamp).toDate(),
  );

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "ownerId":ownerId,
      "categoryId": category.id,
      "title": title,
      "description": description,
      "dateTime": dateTime,
    };
  }
}