import 'package:amazon_clone/constants/globle_variables.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    'https://images.unsplash.com/photo-1590075633056-de7a19338adf?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2NlbmVyeXxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1590075633056-de7a19338adf?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2NlbmVyeXxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1590075633056-de7a19338adf?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2NlbmVyeXxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1590075633056-de7a19338adf?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2NlbmVyeXxlbnwwfHwwfHx8MA%3D%3D',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Your Orders",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "See All",
                style: TextStyle(color: GlobleVariables.selectedNavBarColor),
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 0,
        ),

        // order items displayed here

        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, right: 0, top: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: ((context, index) {
              return SingleProduct(
                image: list[index],
              );
            }),
          ),
        ),
      ],
    );
  }
}
