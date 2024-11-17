import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the product data passed from the previous screen
    final Map<String, dynamic> product = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Handle logout functionality
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product['name'],
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildProductInfoCard(product),
              const SizedBox(height: 16),
              _buildProductStatsCard(product),
              const SizedBox(height: 16),
              _buildOrderHistory(product),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductInfoCard(Map<String, dynamic> product) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Overview',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Description: ${product['description']}'),
            const SizedBox(height: 8),
            Text('Price: \$${product['price']}'),
            const SizedBox(height: 8),
            Text('Stock Quantity: ${product['stock']}'),
          ],
        ),
      ),
    );
  }

  Widget _buildProductStatsCard(Map<String, dynamic> product) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Statistics',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Total Sales: ${product['totalSales']}'),
            const SizedBox(height: 8),
            Text('Reviews: ${product['reviews']}'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderHistory(Map<String, dynamic> product) {
    // Example order history; replace with data from the backend
    final orderHistory = [
      {'orderId': 'ORD101', 'date': '2024-11-01', 'quantity': 10},
      {'orderId': 'ORD102', 'date': '2024-11-03', 'quantity': 5},
      {'orderId': 'ORD103', 'date': '2024-11-05', 'quantity': 7},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order History',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: orderHistory.length,
          itemBuilder: (context, index) {
            final order = orderHistory[index];
            return Card(
              elevation: 4,
              child: ListTile(
                title: Text('Order ID: ${order['orderId']}'),
                subtitle: Text('Date: ${order['date']} - Quantity: ${order['quantity']}'),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    // Navigate to order details
                    Navigator.pushNamed(context, '/order_details', arguments: order);
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
