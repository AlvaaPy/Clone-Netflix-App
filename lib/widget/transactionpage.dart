import 'package:flutter/material.dart';
import 'confirmationpage.dart';

class PaymentTransactionPage extends StatelessWidget {
  final String selectedPaymentMethod;
  final String selectedSubscription;
  final double subscriptionPrice;

  PaymentTransactionPage({
    required this.selectedPaymentMethod,
    required this.selectedSubscription,
    required this.subscriptionPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Transaction'),
        backgroundColor: const Color.fromARGB(255, 75, 74, 74),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900], // Set the background color here
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'Assets/Img/netflix.png',
                    height: 100.0,
                    width: 100.0,
                    // Add any additional styling for the image if needed
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Selected Payment Method:',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  Text(
                    selectedPaymentMethod,
                    style: TextStyle(fontSize: 20.0, color: Colors.greenAccent),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Selected Subscription:',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  Text(
                    selectedSubscription,
                    style: TextStyle(fontSize: 20.0, color: Colors.greenAccent),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Subscription Price: \Rp${subscriptionPrice.toStringAsFixed(3)}',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            // Add your payment transaction UI here

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: Text('Confirm Payment',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
