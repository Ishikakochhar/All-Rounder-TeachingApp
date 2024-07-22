import 'package:flutter/foundation.dart';

class Category {
  final String id;
  final String title;

  Category({required this.id, required this.title});

  @override
  String toString() => '$title';
}

class CategoryData with ChangeNotifier {
  final List<Category> _items = [
    Category(id: 'PA', title: 'Physical Activity'),
    Category(id: 'MA', title: 'Mindfulness Activity'),
    Category(id: 'CA', title: 'Cognitive Activity'),
    Category(id: 'EA', title: 'Emotional Activity'),
    Category(id: 'SA', title: 'Social Activity'),
    Category(id: 'AA', title: 'Academic Activity'),
  ];

  List<Category> get items {
    return [..._items];
  }
}
