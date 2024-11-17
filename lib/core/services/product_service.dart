import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config/constants.dart';

class ProductService {
  Future<List<Map<String, dynamic>>> fetchProducts(String token) async {
    try {
      final response = await http.get(
        Uri.parse(productsUrl),
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(jsonDecode(response.body));
      } else {
        throw Exception("Failed to fetch products");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
