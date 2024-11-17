import 'package:flutter/material.dart';
import '../../../core/services/order_service.dart';

class ProductListScreen extends StatelessWidget {
  final String token;
  const ProductListScreen({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderService = OrderService();

    // Dummy products (Replace with API call for products)
    final products = [
      {"id": "1", "name": "Product A", "price": 100},
      {"id": "2", "name": "Product B", "price": 200},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product['name'] != null ? product['name'] as String : 'Unknown Product'),
            subtitle: Text("Price: \$${product['price'] ?? 0}"),
            trailing: ElevatedButton(
              onPressed: () async {
                // Order Placement API Call
                try {
                  final orderData = {
                    "product_id": product['id'],
                    "customer_location": {"lat": 12.34, "long": 56.78}
                  };
                  final response = await orderService.createOrder(token, orderData);
                  print("Order Created: ${response['id']}");
                } catch (e) {
                  print("Error placing order: $e");
                }
              },
              child: Text('Order'),
            ),
          );
        },
      ),
    );
  }
}
