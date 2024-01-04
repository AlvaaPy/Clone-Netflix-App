import 'package:flutter/material.dart';
import 'homepage.dart';

class ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Confirmation'),
        backgroundColor: const Color.fromARGB(255, 75, 74, 74),
      ),
      body: Container(
        color: Colors.grey[900],
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 100.0,
              color: Color.fromARGB(255, 127, 206, 130),
            ),
            SizedBox(height: 20.0),
            Text(
              'Payment Confirmed!',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255)),
            ),
            SizedBox(height: 10.0),
            Text(
              'Thank you for your payment. Your subscription is now active.',
              style: TextStyle(
                  fontSize: 16.0,
                  color: const Color.fromARGB(255, 255, 255, 255)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HomePage(), // Correct the class name here
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: Text('Back', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
