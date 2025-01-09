import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/constants/globle_variables.dart';
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    ////////  Add product /////////////

    try {
      final cloudinary = CloudinaryPublic('dd2jxam73', 'nvdl4d8n');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          price: price,
          quantity: quantity,
          category: category,
          images: imageUrls);

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            Navigator.pop(context);
            showSnackBar(context, 'successfully!');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  ////////// show all products //////////

  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];

    try {
      http.Response res = await http.get(
        Uri.parse('$uri/admin/get-products'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            final decodedJson = jsonDecode(res.body);
            print(decodedJson);

            if (decodedJson == null) {
              showSnackBar(context, 'Failed to parse JSON response.');
            }

            if (jsonDecode(res.body) != null) {
              for (int i = 0;
                  i < jsonDecode(res.body)['products'].length;
                  i++) {
                productList.add(Product.fromJson(
                    jsonEncode(jsonDecode(res.body)['products'][i])));
              }
            }
          });
    } catch (e) {
      showSnackBar(context, 'fetch all product ${e.toString()} ');
    }

    return productList;
  }

  // Future<List<Product>> fetchAllProducts(BuildContext context) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   List<Product> productList = [];

  //   try {
  //     final token = userProvider.user.token;
  //     if (token == null) {
  //       showSnackBar(context, 'User token is null. Please log in again.');
  //       return [];
  //     }

  //     if (uri == null || uri.isEmpty) {
  //       showSnackBar(context, 'Server URI is not configured.');
  //       return [];
  //     }

  //     http.Response res = await http.get(
  //       Uri.parse('$uri/admin/get-products'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'x-auth-token': token,
  //       },
  //     );

  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () {
  //         final decodedJson = jsonDecode(res.body);
  //         print(decodedJson);
  //         if (decodedJson == null) {
  //           showSnackBar(context, 'Failed to parse JSON response.');
  //           return;
  //         }

  //         try {
  //           productList = List<Product>.from(
  //               decodedJson.map((data) => Product.fromJson(dat)));
  //         } catch (e) {
  //           showSnackBar(context, 'Error parsing products: $e');
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     showSnackBar(context, 'An error occurred: $e');
  //   }

  //   return productList;
  // }

  //////////// delete product from database ////////

  // Future<bool> deleteProduct(
  //     {required BuildContext context, required String productId}) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   bool deleteResult = false;
  //   try {
  //     http.Response res =
  //         await http.post(Uri.parse('$uri/admin/delete-product'),
  //             headers: <String, String>{
  //               'Content-Type': 'application/json; charset=UTF-8',
  //               'x-auth-token': userProvider.user.token,
  //             },
  //             body: jsonEncode({'productId': productId}));

  //     httpErrorHandle(
  //         response: res,
  //         context: context,
  //         onSuccess: () {
  //           print(res.body);
  //         });
  //   } catch (e) {
  //     showSnackBar(context, "delete product : ${e.toString()}");
  //   }

  //   return deleteResult;
  // }

  void deleteProduct(
      {required BuildContext context,
      required Product product,
      required VoidCallback onSuccess}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: json.encode({'productId': product.id}),
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            onSuccess();
          });
    } catch (e) {
      showSnackBar(context, 'delete product ${e.toString()} ');
    }
  }
}
