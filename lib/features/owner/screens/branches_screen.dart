import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/loading_indicator.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Branches'),
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
              const Text(
                'Branch Overview',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildBranchList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBranchList(BuildContext context) {
    // Example branch list; replace with data from the backend
    final branches = [
      {'name': 'Branch 1', 'orders': 40, 'location': 'Location 1'},
      {'name': 'Branch 2', 'orders': 35, 'location': 'Location 2'},
      {'name': 'Branch 3', 'orders': 45, 'location': 'Location 3'},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: branches.length,
      itemBuilder: (context, index) {
        final branch = branches[index];
        return ListTile(
          title: Text(branch['name'] as String),  // Cast to String
          subtitle: Text('Orders: ${branch['orders']} - Location: ${branch['location'] as String}'),  // Cast location to String
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // Navigate to branch details
              Navigator.pushNamed(context, '/branch_details', arguments: branch);
            },
          ),
        );
      },
    );
  }
}
