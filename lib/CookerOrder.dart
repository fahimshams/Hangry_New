import 'package:flutter/material.dart';

class Order {
  final String customerName;
  final String foodName;
  final double price;

  Order(this.customerName, this.foodName, this.price);
}

class CookerOrdersPage extends StatelessWidget {
  final List<Order> orders;

  CookerOrdersPage(this.orders);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cooker Orders'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Orders',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  Order order = orders[index];
                  return Card(
                    margin: EdgeInsets.only(top: 8),
                    child: ListTile(
                      title: Text('Customer: ${order.customerName}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Food: ${order.foodName}'),
                          Text('Price: \$${order.price.toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
