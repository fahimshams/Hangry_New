import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CheckoutPage.dart';
import 'custom-app-bar.dart';
import 'main.dart';
import 'Cart_Provider.dart'; // Import your cart provider file

class FoodInfo {
  final String name;
  final String cookerInfo;
  final List<CookInformation> cooks;

  FoodInfo(this.name, this.cookerInfo, this.cooks);
}

class CookInformation {
  final String cookName;
  final String specialty;
  final double distance;
  final double price;

  CookInformation(this.cookName, this.specialty, this.distance, this.price);
}

class FoodInfoPage extends StatelessWidget {
  final FoodInfo foodInfo;

  FoodInfoPage(this.foodInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Hungry?',
        locationText: 'Lancaster,PA',
        onAccountPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyPage()),
          );
        },
        onCartPressed: () {
          // Navigate to the cart page or perform cart-related actions
        },
        itemCount: context.watch<CartProvider>().itemCount,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Food Name: ${foodInfo.name}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Cooker Information: ${foodInfo.cookerInfo}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Cooks:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            for (var cook in foodInfo.cooks)
              Card(
                margin: EdgeInsets.only(top: 8),
                child: ListTile(
                  title: Text(cook.cookName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Specialty: ${cook.specialty}'),
                      Text('Distance from Customer: ${cook.distance} km'),
                      Text(
                          'Price: \$${cook.price.toStringAsFixed(2)}'), // Display the price
                    ],
                  ),
                  onTap: () {
                    // Navigate to the checkout page when a cook is selected
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutPage(cook),
                      ),
                    );
                  },
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add the selected item to the cart
                context.read<CartProvider>().addItemToCart();
                // Optionally, you can show a snackbar or perform other actions
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added to Cart!'),
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
