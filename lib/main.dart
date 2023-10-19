import 'package:flutter/material.dart';
import 'package:media_uploads/screens/login_screen.dart';
import 'package:media_uploads/screens/product_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: LoginApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
       backgroundColor: Colors.white,
        ),
        body: Center(
          child: LoginPage(),

        ),

      ),
      debugShowCheckedModeBanner: false,
    );
  }

}
