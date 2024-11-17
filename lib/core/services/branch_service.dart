import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config/constants.dart';

class BranchService {
  Future<List<Map<String, dynamic>>> fetchBranches(String token) async {
    try {
      final response = await http.get(
        Uri.parse(branchesUrl),
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(jsonDecode(response.body));
      } else {
        throw Exception("Failed to fetch branches");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
