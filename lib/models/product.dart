import 'package:flutter/material.dart';

class Product {
  const Product({required this.id, required this.title, required this.category,
    required this.price, required this.rating, required this.reviewsCount,
    required this.badge});
  final String id;
  final String title;
  final String category;
  final double price;
  final double rating;
  final int reviewsCount;
  final String badge;

  IconData get categoryIcon => switch (category) {
    'Laptops' => Icons.laptop_mac_outlined,
    'Smartphones' => Icons.smartphone_outlined,
    'Audio' => Icons.headphones_outlined,
    'Tablets' => Icons.tablet_mac_outlined,
    'Wearables' => Icons.watch_outlined,
    'Peripherals' => Icons.keyboard_outlined,
    'Monitors' => Icons.monitor_outlined,
    'Cameras' => Icons.photo_camera_outlined,
    'Gaming' => Icons.sports_esports_outlined,
    'Smart Home' => Icons.home_outlined,
    'Storage' => Icons.sd_storage_outlined,
    _ => Icons.inventory_2_outlined,
  };
  Color get accentColor => switch (category) {
    'Laptops' => Colors.indigo,
    'Smartphones' => Colors.deepPurple,
    'Audio' => Colors.teal,
    'Tablets' => Colors.blue,
    'Wearables' => Colors.orange,
    'Peripherals' => Colors.blueGrey,
    'Monitors' => Colors.cyan,
    'Cameras' => Colors.pink,
    'Gaming' => Colors.red,
    'Smart Home' => Colors.green,
    'Storage' => Colors.brown,
    _ => Colors.deepOrange,
  };

  Product copyWith({required String id, String? title, String? badge}) =>
    Product(id: id, title: title ?? this.title, category: category,
      price: price, rating: rating, reviewsCount: reviewsCount,
      badge: badge ?? this.badge);
}
