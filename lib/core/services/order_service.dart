import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config/constants.dart';

class OrderService {
  Future<Map<String, dynamic>> createOrder(
      String token, Map<String, dynamic> orderData) async {
    try {
      final response = await http.post(
        Uri.parse(ordersUrl),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode(orderData),
      );

      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to create order");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  fetchBranchOrders(String token, String branchId) {}
}
