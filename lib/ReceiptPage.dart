import 'package:flutter/material.dart';
import 'package:helloworld/FoodInfoPage.dart';

class ReceiptPage extends StatelessWidget {
  final CookInformation selectedCook;

  ReceiptPage(this.selectedCook);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Order Confirmed!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Cook: ${selectedCook.cookName}',
              style: TextStyle(fontSize: 16),
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
          ],
        ),
      ),
    );
  }
}
