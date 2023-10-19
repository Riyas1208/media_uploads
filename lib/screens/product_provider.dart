import 'package:flutter/material.dart';
import 'package:media_uploads/screens/product_model.dart';
class ProductProvider with ChangeNotifier {
  List<Product> products = []; // List of all products
  List<Product> filteredProducts = []; // List of filtered products

  // Add products to the list (you can replace this with your data retrieval logic)
  void addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }

  // Method to search for products based on the search query
  void searchProducts(String query) {
    if (query.isEmpty) {
      // If the search query is empty, show all products
      filteredProducts = List.from(products);
    } else {
      // If the search query is not empty, filter products by name
      filteredProducts = products
          .where((product) =>
          product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    notifyListeners(); // Notify listeners to update the UI
  }
}

