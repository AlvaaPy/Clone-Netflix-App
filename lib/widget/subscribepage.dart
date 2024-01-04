import 'package:flutter/material.dart';
import 'paymentpage.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 25.0),
            SubscriptionCard(
              plan: 'Standard Plan',
              price: 13.999,
              features: [
                'HD video quality',
                'Access on two devices simultaneously'
              ],
              imageAsset: 'Assets/Img/netflix.png',
            ),
            SizedBox(height: 20.0),
            SubscriptionCard(
              plan: 'Premium Plan',
              price: 16.999,
              features: [
                'Ultra HD video quality',
                'Access on four devices simultaneously',
                'Download content for offline viewing'
              ],
              imageAsset: 'Assets/Img/netflix.png',
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final String plan;
  final double price;
  final List<String> features;
  final String imageAsset;

  SubscriptionCard({
    required this.plan,
    required this.price,
    required this.features,
    required this.imageAsset,
    String? selectedPaymentMethod, // Define the named parameter here
  });

  @override
  Widget build(BuildContext context) {
    final priceFormatted = '\Rp${price.toStringAsFixed(3)}';

    return Card(
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageAsset,
              height: 50.0,
              width: 50.0,
            ),
            SizedBox(height: 10.0),
            Text(
              plan,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              priceFormatted,
              style: TextStyle(fontSize: 16.0, color: Colors.green),
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features.map((feature) => Text('• $feature')).toList(),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(),
                  ),
                );
              },
              child: Text('Subscribe Now'),
            ),
          ],
        ),
      ),
    );
  }
}
