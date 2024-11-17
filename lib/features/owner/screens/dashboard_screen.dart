import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/loading_indicator.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Owner Dashboard'),
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
                'Welcome, Owner!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('Overview'),
              const SizedBox(height: 8),
              _buildOverviewCard(context),
              const SizedBox(height: 16),
              _buildSectionTitle('Branches'),
              const SizedBox(height: 8),
              _buildBranchesList(context),
              const SizedBox(height: 16),
              _buildSectionTitle('Analytics'),
              const SizedBox(height: 8),
              _buildAnalyticsCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildOverviewCard(BuildContext context) {
    return const Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today’s Summary',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _DashboardStat(title: 'Orders', value: '120'),
                _DashboardStat(title: 'Revenue', value: '\$5,600'),
                _DashboardStat(title: 'Deliveries', value: '98'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBranchesList(BuildContext context) {
    // Example branch list; replace with data from the backend
    final branches = [
      {'name': 'Branch 1', 'orders': 40},
      {'name': 'Branch 2', 'orders': 35},
      {'name': 'Branch 3', 'orders': 45},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: branches.length,
      itemBuilder: (context, index) {
        final branch = branches[index];
        return ListTile(
          title: Text(branch['name'] as String),  // Cast to String
          subtitle: Text('Orders: ${branch['orders']}'),  // 'orders' is an int, no cast required
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

  Widget _buildAnalyticsCard(BuildContext context) {
    return const Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Performance Analytics',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Orders: 500 (This Month)'),
            SizedBox(height: 4),
            Text('Revenue: \$20,000 (This Month)'),
            SizedBox(height: 4),
            Text('Customer Satisfaction: 92%'),
          ],
        ),
      ),
    );
  }
}

class _DashboardStat extends StatelessWidget {
  final String title;
  final String value;

  const _DashboardStat({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
