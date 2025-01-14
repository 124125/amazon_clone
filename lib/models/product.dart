import 'dart:convert';

import 'package:amazon_clone/models/rating.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String category;
  final List<String> images;
  final String? id;
  final List<Rating>? rating;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.images,
    this.id,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'category': category,
      'images': images,
      'id': id,
      'rating': rating,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      description: map['description'] as String,
      price: (map['price'] is int) // Check if price is int
          ? (map['price'] as int).toDouble() // Convert to double
          : (map['price'] as double? ??
              0.0), // Use as double or fallback to 0.0,
      quantity: map['quantity'] as int,
      category: map['category'] as String,
      images: List<String>.from(map['images'] ?? []),
      id: map['_id'] != null ? map['_id'] as String : null,
      rating: map['ratings'] != null
          ? List<Rating>.from(map['ratings']?.map((x) => Rating.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
