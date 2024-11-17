import 'package:flutter/material.dart';

class BranchDetailsScreen extends StatelessWidget {
  const BranchDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the branch data passed from the previous screen
    final Map<String, dynamic> branch = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(branch['name']),
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
                'Branch Details: ${branch['name']}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildBranchInfoCard(branch),
              const SizedBox(height: 16),
              _buildOrdersList(branch),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBranchInfoCard(Map<String, dynamic> branch) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Branch Overview',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Location: ${branch['location']}'),
            const SizedBox(height: 8),
            Text('Orders: ${branch['orders']}'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersList(Map<String, dynamic> branch) {
    // Example order list; replace with data from the backend or API
    final orders = [
      {'orderId': 'ORD123', 'status': 'Completed'},
      {'orderId': 'ORD124', 'status': 'Pending'},
      {'orderId': 'ORD125', 'status': 'Shipped'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Orders',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Card(
              elevation: 4,
              child: ListTile(
                title: Text('Order ID: ${order['orderId']}'),
                subtitle: Text('Status: ${order['status']}'),
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
