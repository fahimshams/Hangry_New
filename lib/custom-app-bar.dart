import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String locationText;
  final VoidCallback onAccountPressed;
  final VoidCallback onCartPressed;
  final int itemCount; // Ensure itemCount is defined

  CustomAppBar({
    required this.title,
    required this.locationText,
    required this.onAccountPressed,
    required this.onCartPressed,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(locationText),
              SizedBox(width: 20),
              GestureDetector(
                onTap: onAccountPressed,
                child: Icon(Icons.account_circle),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: onCartPressed,
                child: Stack(
                  children: [
                    Icon(Icons.shopping_cart),
                    Positioned(
                      right: 0,
                      child: itemCount > 0
                          ? CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.red,
                              child: Text(
                                itemCount.toString(),
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          : SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      // Add other app bar properties as needed
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
