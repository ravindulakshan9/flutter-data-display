// ignore_for_file: depend_on_referenced_packages

import '../models/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      List<Product> products = [];
      List<dynamic> data = json.decode(response.body)['products'];
      for (var product in data) {
        products.add(Product.fromJson(product));
      }
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
