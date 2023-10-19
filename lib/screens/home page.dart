import 'package:flutter/material.dart';
import 'package:media_uploads/screens/product_grid.dart';

import '../util/colors.dart';
import 'app bar.dart';


void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: HomeScreen(),));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List _widgets = const [

    ProductGridWidget(),




  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const AppBarWidget(),
            SliverList.builder(
                itemCount: _widgets.length,
                itemBuilder: (context,index) => _widgets[index]
            ),
          ],
        ),
      ),
    );
  }
}