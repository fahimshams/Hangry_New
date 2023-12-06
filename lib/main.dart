import 'package:flutter/material.dart';
import 'FoodInfoPage.dart';
import 'CheckoutPage.dart';
import 'custom-app-bar.dart';
import 'package:provider/provider.dart';
import 'Cart_Provider.dart';
import 'loginPage.dart';
import 'registrationForCooker.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      title: "Hangry?",
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class FoodItem {
  final String name;
  final double price;

  FoodItem(this.name, this.price);
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> bengaliFoods = [
    'Biriyani',
    'Khichuri',
    'Hilsha Fish Curry',
    'Rasgulla',
    'Sandesh',
    'Mishti Doi',
    'Rasmalai',
    'Chomchom',
    // Add more Bengali food items as needed
  ];

  final Map<String, double> foodPrices = {
    'Biriyani': 10.99,
    'Khichuri': 8.99,
    'Hilsha Fish Curry': 12.99,
    'Rasgulla': 5.99,
    'Sandesh': 4.99,
    'Mishti Doi': 3.99,
    'Rasmalai': 6.99,
    'Chomchom': 7.99,
    // Add more prices as needed
  };

  // Define the exact location text
  final String locationText = 'Your Exact Location Here';

  // Search filter variables
  String searchQuery = '';
  List<String> filteredFoods = [];

  @override
  void initState() {
    super.initState();
    filteredFoods = bengaliFoods;
  }

  void filterFoods(String query) {
    setState(() {
      searchQuery = query;
      filteredFoods = bengaliFoods
          .where(
              (food) => food.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckoutPage()),
          );
          // Navigate to the cart page or perform cart-related actions
        },
        itemCount: context.watch<CartProvider>().itemCount,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) => filterFoods(query),
              decoration: InputDecoration(
                hintText: 'Search for food...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFoods.length,
              itemBuilder: (context, index) {
                final foodName = filteredFoods[index];
                final price = foodPrices[foodName] ??
                    0.0; // Default to 0 if price is not found
                return Card(
                  elevation: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: Icon(Icons.food_bank),
                    title: Text(
                      '$foodName - \$${price.toStringAsFixed(2)}',
                    ),
                    onTap: () {
                      FoodInfo foodInfo = FoodInfo(
                        'Biriyani',
                        'Cooker Information',
                        [
                          CookInformation(
                              'Cook 1', 'Biriyani Specialist', 3.5, price),
                          CookInformation(
                              'Cook 2', 'Spicy Biriyani Expert', 7.2, price),
                        ],
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodInfoPage(foodInfo),
                        ),
                      );
                      // You can add logic to navigate to a detailed food page here
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I AM A ?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPageForEater()),
                );
              },
              child: Text('Eater !'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPageForCooker()),
                );
              },
              child: Text('Cooker !'),
            ),
          ],
        ),
      ),
    );
  }
}
