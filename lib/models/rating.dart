// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Rating {
  final String userId;
  final double rating;

  Rating({required this.userId, required this.rating});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'rating': rating,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      userId: map['userId'] as String,
      rating: (map['rating'] is int) // Check if price is int
          ? (map['rating'] as int).toDouble() // Convert to double
          : (map['rating'] as double? ?? 0.0),
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) =>
      Rating.fromMap(json.decode(source) as Map<String, dynamic>);
}
