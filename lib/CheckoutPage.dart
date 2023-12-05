import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cart_Provider.dart';
import 'ReceiptPage.dart'; // Import your cart provider file

class CheckoutPage extends StatelessWidget {
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
              'Items in Cart:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Display the items in the cart
            for (var item in context.watch<CartProvider>().cartItems)
              ListTile(
                title: Text(item.name),
                subtitle: Text('Price: \$${item.price.toStringAsFixed(2)}'),
              ),
            SizedBox(height: 20),
            Text(
              'Total Items: ${context.watch<CartProvider>().itemCount}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Perform checkout logic, e.g., payment processing

                // Navigate to the receipt page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ReceiptPage()),
                );
              },
              child: Text('Proceed to Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
