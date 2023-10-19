import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductCard({ required this.imageUrl,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0,
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 7.0),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
            SizedBox(height: 4.0),

          ],
        ),
      ),
    );
  }
}

