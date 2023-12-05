import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cart_Provider.dart'; // Import your cart provider file
import 'main.dart'; // Import your main.dart file or adjust the import path as needed

class ReceiptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Clear the cart and navigate to the home page
            context.read<CartProvider>().clearCart();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
              (route) => false,
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Receipt:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Display the items in the receipt
            for (var item in cartItems)
              ListTile(
                title: Text(item.name),
                subtitle: Text('Price: \$${item.price.toStringAsFixed(2)}'),
              ),
            SizedBox(height: 20),
            Text(
              'Total Items: ${context.watch<CartProvider>().itemCount}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
