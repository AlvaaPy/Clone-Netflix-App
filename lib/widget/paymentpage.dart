import 'package:flutter/material.dart';
import 'transactionpage.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Options'),
        backgroundColor: const Color.fromARGB(255, 75, 74, 74),
      ),
      body: Container(
        color: Color.fromARGB(255, 48, 47, 47),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            PaymentMethodCard(
              paymentMethod: 'MBanking',
              icon: Icons.mobile_screen_share,
              onPressed: () {
                _selectPaymentMethod('MBanking');
              },
            ),
            SizedBox(height: 20.0),
            PaymentMethodCard(
              paymentMethod: 'Dana',
              icon: Icons.account_balance_wallet,
              onPressed: () {
                _selectPaymentMethod('Dana');
              },
            ),
            SizedBox(height: 20.0),
            PaymentMethodCard(
              paymentMethod: 'ShopeePay',
              icon: Icons.shopping_bag,
              onPressed: () {
                _selectPaymentMethod('ShopeePay');
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (selectedPaymentMethod != null) {
                  _navigateToPaymentTransaction(context);
                } else {
                  // Show a message or handle when no payment method is selected
                }
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

  void _selectPaymentMethod(String paymentMethod) {
    setState(() {
      selectedPaymentMethod = paymentMethod;
    });
  }

  void _navigateToPaymentTransaction(BuildContext context) {
    // Replace 'Your Subscription Plan' and 13.99 with actual values
    String selectedSubscription = 'Your Subscription Plan';
    double subscriptionPrice = 13.999;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentTransactionPage(
          selectedPaymentMethod: selectedPaymentMethod!,
          selectedSubscription: selectedSubscription,
          subscriptionPrice: subscriptionPrice,
        ),
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  final String paymentMethod;
  final IconData icon;
  final VoidCallback onPressed;

  PaymentMethodCard({
    required this.paymentMethod,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 30.0),
                SizedBox(width: 10.0),
                Text(
                  'Pay with $paymentMethod',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: Text('Select Payment Method',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
