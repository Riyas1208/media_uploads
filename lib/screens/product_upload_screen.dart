import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'product_model.dart';
import 'product_provider.dart';

class ProductUploadScreen extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController mediaPathController = TextEditingController();

  ProductUploadScreen({super.key});
  Future<void> _pickMedia() async {
    final picker = ImagePicker();
    final XFile? pickedMedia = await picker.pickImage(source: ImageSource.gallery); // You can use ImageSource.camera for the camera

    if (pickedMedia != null) {
      mediaPathController.text = pickedMedia.path;
    }
  }

  Future<void> _uploadProduct(BuildContext context) async {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);

    final id = int.tryParse(idController.text);
    final price = double.tryParse(priceController.text);

    if (id != null && price != null) {
      final product = Product(
        id: id,
        name: titleController.text,
        price: price,
        description: descriptionController.text,
        image: mediaPathController.text,
      );

      productProvider.addProduct(product);
      Navigator.pop(context); // Navigate back to the product list screen
    } else {
      // Handle input validation errors, e.g., show an error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Validation Error'),
            content: Text('Please enter valid ID and Price.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Upload'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: idController,
              decoration: InputDecoration(labelText: 'ID'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
              onPressed: _pickMedia,
              child: Text('Select Media (Image/Video)'),
            ),

            ElevatedButton(
              onPressed: () {
                _uploadProduct(context);
              },
              child: Text('Upload Product'),
            ),
          ],
        ),
      ),
    );
  }
}
