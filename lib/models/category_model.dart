import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String name;
  IconData iconData;
  String imagePath;
  CategoryModel({required this.id, required this.name, required this.iconData, required this.imagePath});
 static List<CategoryModel> categories = [
    CategoryModel(id: "1", name: "Sports", iconData: Icons.sports_football, imagePath: "imagePath"),
    CategoryModel(id: "2", name: "Book Club", iconData: Icons.bookmark_outlined, imagePath: "imagePath"),
    CategoryModel(id: "3", name: "Birthday", iconData: Icons.cake, imagePath: "imagePath"),
    CategoryModel(id: "4", name: "Meeting", iconData: Icons.laptop_chromebook_outlined, imagePath: "imagePath"),
    CategoryModel(id: "5", name: "Exhibition", iconData: Icons.water_drop_rounded, imagePath: "imagePath"),
  ];
}