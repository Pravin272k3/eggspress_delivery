import 'package:flutter/material.dart';
import '../../../core/services/branch_service.dart';

class BranchDashboard extends StatefulWidget {
  final String token; // Pass token for authenticated requests
  const BranchDashboard({Key? key, required this.token}) : super(key: key);

  @override
  _BranchDashboardState createState() => _BranchDashboardState();
}

class _BranchDashboardState extends State<BranchDashboard> {
  final BranchService branchService = BranchService();
  List<Map<String, dynamic>> branches = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBranchData();
  }

  Future<void> fetchBranchData() async {
    try {
      final response = await branchService.fetchBranches(widget.token);
      setState(() {
        branches = response;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching branches: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Branch Dashboard')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: branches.length,
        itemBuilder: (context, index) {
          final branch = branches[index];
          return ListTile(
            title: Text(branch['name']),
            subtitle: Text(branch['address']),
            onTap: () {
              // Navigate to Order Management for this branch
              Navigator.pushNamed(
                context,
                '/branch/orders',
                arguments: branch['id'],
              );
            },
          );
        },
      ),
    );
  }
}
