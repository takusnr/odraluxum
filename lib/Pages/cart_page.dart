import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  void _purchase(BuildContext context) {
    // Implement your purchase logic here
    // You can show order summary, process payment, etc.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Purchase Confirmation'),
          content: Text('Thank you for your purchase!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Clear cart items and navigate back to previous page (ShopPage.dart)
                Navigator.of(context).pop(); // Pop the dialog
                Navigator.of(context).pop(); // Pop the CartPage
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  double _calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      // Hapus karakter non-numerik kecuali '.' dan ','
      String priceString =
          item['price'].toString().replaceAll(RegExp(r'[^\d.,]'), '');
      // Hilangkan karakter '.' jika terdapat ',' untuk memastikan format yang benar
      priceString = priceString.contains(',')
          ? priceString.replaceAll('.', '')
          : priceString;
      // Ubah string ke dalam format yang sesuai
      double price = double.parse(priceString);
      total += price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text('No items in the cart.'),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.asset(item['image']),
                  title: Text(item['title']),
                  subtitle: Text(item['price']
                      .toString()), // Show the original price format
                );
              },
            ),
      bottomNavigationBar: cartItems.isNotEmpty
          ? BottomAppBar(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: \$${_calculateTotal().toStringAsFixed(2)}', // Format total dengan 2 desimal
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _purchase(context);
                      },
                      child: Text('Purchase'),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
