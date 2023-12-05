import 'package:flutter/material.dart';
import 'package:helloworld/FoodInfoPage.dart';
import 'ReceiptPage.dart';

class CheckoutPage extends StatelessWidget {
  final CookInformation selectedCook;

  CheckoutPage(this.selectedCook);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Selected Cook: ${selectedCook.cookName}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Specialty: ${selectedCook.specialty}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Distance from Customer: ${selectedCook.distance} km',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Price: \$${selectedCook.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the receipt page after confirming the order
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReceiptPage(selectedCook),
                  ),
                );
              },
              child: Text('Confirm Order'),
            ),
          ],
        ),
      ),
    );
  }
}
