import 'package:flutter/material.dart';
import '../../../core/services/order_service.dart';

class OrderManagement extends StatefulWidget {
  final String branchId;
  final String token;

  const OrderManagement({Key? key, required this.branchId, required this.token})
      : super(key: key);

  @override
  _OrderManagementState createState() => _OrderManagementState();
}

class _OrderManagementState extends State<OrderManagement> {
  final OrderService orderService = OrderService();
  List<Map<String, dynamic>> orders = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      final response =
      await orderService.fetchBranchOrders(widget.token, widget.branchId);
      setState(() {
        orders = response;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching orders: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Management')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(order['product']['name']),
              subtitle: Text("Customer: ${order['customer_name']}"),
              trailing: Text("Status: ${order['status']}"),
              onTap: () {
                // Open order details or update status
              },
            ),
          );
        },
      ),
    );
  }
}
