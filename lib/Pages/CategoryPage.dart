import 'cart_page.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final String? title;
  final String? image;
  final String? tag;
  final List<Map<String, dynamic>> products;

  const CategoryPage({Key? key, this.title, this.image, this.tag, required this.products}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Map<String, dynamic>> cartItems = [];
  Map<String, bool> _cartIconAnimationStatus = {};

  void addToCart(String image, String title, String price) {
    setState(() {
      cartItems.add({
        'image': image,
        'title': title,
        'price': price,
      });
      _cartIconAnimationStatus[title] = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title berhasil ditambahkan ke keranjang'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 50.0, left: 10.0, right: 10.0),
      ),
    );

    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _cartIconAnimationStatus[title] = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: widget.tag!,
              child: Material(
                child: Container(
                  height: 360,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.1),
                        ],
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.favorite, color: Colors.white),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CartPage(cartItems: cartItems)),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Text(
                          widget.title!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "New Product",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "View More",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward_ios, size: 11, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: widget.products.map((product) {
                      return makeProduct(
                        image: product['image'],
                        title: product['title'],
                        price: product['price'],
                      );
                    }).toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeProduct({required String image, required String title, required String price}) {
    bool animate = _cartIconAnimationStatus[title] ?? false;
    return GestureDetector(
      onTap: () {
        addToCart(image, title, price);
        print('Product added to cart: $title');
      },
      child: Container(
        height: 200,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title, style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(price, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Bounce(
                    from: 10,
                    animate: animate,
                    child: GestureDetector(
                      onTap: () {
                        addToCart(image, title, price);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(Icons.add_shopping_cart, size: 18, color: Colors.grey[700]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
