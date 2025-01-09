import 'package:amazon_clone/common/widgets/stars.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchedProducts extends StatelessWidget {
  final Product searchedProduct;
  const SearchedProducts({super.key, required this.searchedProduct});

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;

    for (var i = 0; i < searchedProduct.rating!.length; i++) {
      totalRating += searchedProduct.rating![i].rating;
    }

    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / searchedProduct.rating!.length;
    }
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.network(
                searchedProduct.images[0],
                fit: BoxFit.contain,
                height: 130,
                width: 130,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: 235,
                    child: Text(
                      searchedProduct.name,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    width: 235,
                    child: Stars(
                      rating: avgRating,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    width: 235,
                    child: Text(
                      '\$${searchedProduct.price}',
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    width: 235,
                    child: const Text(
                      'Eligible for Free shipping',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    width: 235,
                    child: const Text(
                      'In Stocks',
                      maxLines: 2,
                      style: TextStyle(fontSize: 16, color: Colors.teal),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
