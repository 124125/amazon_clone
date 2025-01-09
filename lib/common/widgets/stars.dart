// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:amazon_clone/constants/globle_variables.dart';

class Stars extends StatelessWidget {
  final double rating;
  const Stars({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: 16,
      rating: rating,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: GlobleVariables.secondaryColor,
      ),
    );
  }
}
