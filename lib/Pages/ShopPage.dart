import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_complete_e_commerce_master/Pages/CategoryPage.dart';
import 'package:flutter_complete_e_commerce_master/Pages/cart_page.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool _isCartAnimated = false;
  List<Map<String, dynamic>> _cartItems = [];

  void _animateCart() {
    setState(() {
      _isCartAnimated = true;
    });

    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _isCartAnimated = false;
      });
    });
  }

  void _navigateToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cartItems: _cartItems),
      ),
    );
  }

  void _addToCart(Map<String, dynamic> product) {
    setState(() {
      _cartItems.add(product);
    });
    _animateCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FadeInUp(
              duration: Duration(milliseconds: 1000),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.8),
                        Colors.black.withOpacity(.2),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeInUp(
                              duration: Duration(milliseconds: 1200),
                              child: IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            FadeInUp(
                              duration: Duration(milliseconds: 1300),
                              child: GestureDetector(
                                onTap: _navigateToCart,
                                child: _isCartAnimated
                                    ? Bounce(
                                        from: 10,
                                        duration: Duration(milliseconds: 1000),
                                        child: Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FadeInUp(
                                duration: Duration(milliseconds: 1500),
                                child: Text(
                                  'Our New Products ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              FadeInUp(
                                duration: Duration(milliseconds: 1700),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "VIEW MORE",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            FadeInUp(
              duration: Duration(milliseconds: 1400),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Categories",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("All")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          makeCategory(
                            image: 'assets/images/vanili.png',
                            title: 'Vanilla',
                            tag: 'vanili',
                            products: [
                              {
                                'image': 'assets/images/Vanilla-Sweet.png',
                                'title': 'Vanilla Sweet Dream',
                                'price': '85\$',
                                'bestSeller': false
                              },
                              {
                                'image': 'assets/images/Vanilla-Fantasy.png',
                                'title': 'Vanilla Fantasy',
                                'price': '75\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Vanilla-Delight.png',
                                'title': 'Vanilla Delight',
                                'price': '105\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Vanilla-Bliss.png',
                                'title': 'Vanilla Bliss',
                                'price': '65\$',
                                'bestSeller': false
                              },
                              {
                                'image': 'assets/images/Vanilla-Black.png',
                                'title': 'Vanilla Black',
                                'price': '60\$',
                                'bestSeller': true
                              },
                            ],
                          ),
                          makeCategory(
                            image: 'assets/images/eleganto.png',
                            title: 'Elegant',
                            tag: 'Elegant',
                            products: [
                              {
                                'image': 'assets/images/Elegant-Luxe.png',
                                'title': 'Elegant Luxe',
                                'price': '105\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Elegant-Majestic.png',
                                'title': 'Elegant Majestic Aura',
                                'price': '200\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Elegant-Opulent.png',
                                'title': 'Elegant Opulence',
                                'price': '99\$',
                                'bestSeller': false
                              },
                              {
                                'image': 'assets/images/Elegant-Regal.png',
                                'title': 'Elegant Regal Grace',
                                'price': '75\$',
                                'bestSeller': false
                              },
                              {
                                'image': 'assets/images/Elegant-Royal.png',
                                'title': 'Elegant Royal Ambrosia',
                                'price': '150\$',
                                'bestSeller': true
                              },
                            ],
                          ),
                          makeCategory(
                            image: 'assets/images/powder.png',
                            title: 'Powder',
                            tag: 'Powder',
                            products: [
                              {
                                'image': 'assets/images/Powder-Cashmere.png',
                                'title': 'Powder Cashmere',
                                'price': '99\$',
                                'bestSeller': false
                              },
                              {
                                'image': 'assets/images/Powder-Petals.png',
                                'title': 'Powder Petals',
                                'price': '130\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Powder-Silk.png',
                                'title': 'Powder Silk',
                                'price': '88\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Powder-Soft.png',
                                'title': 'Powder Soft',
                                'price': '77\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Powder-Whispering.png',
                                'title': 'Powder Whispering',
                                'price': '70\$',
                                'bestSeller': false
                              },
                            ],
                          ),
                          makeCategory(
                            image: 'assets/images/freshto.png',
                            title: 'Fresh',
                            tag: 'Fresh',
                            products: [
                              {
                                'image': 'assets/images/Fresh-Aqua.png',
                                'title': 'Fresh Aqua',
                                'price': '99\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Fresh-Breeze.png',
                                'title': 'Fresh Breeze',
                                'price': '88\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Fresh-Citrus.png',
                                'title': 'Fresh Citrus',
                                'price': '89\$',
                                'bestSeller': false
                              },
                              {
                                'image': 'assets/images/Fresh-Dewy.png',
                                'title': 'Fresh Dewy',
                                'price': '90\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Fresh-Green.png',
                                'title': 'Fresh Green',
                                'price': '105\$',
                                'bestSeller': false
                              },
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Best Selling by Category",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("All")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          makeBestCategory(
                            image: 'assets/images/freshr.png',
                            title: 'Fresh',
                            products: [
                              {
                                'image': 'assets/images/Fresh-Aqua.png',
                                'title': 'Fresh Aqua',
                                'price': '99\$',
                                'bestSeller': true
                              },
                              { 
                                'image': 'assets/images/Fresh-Breeze.png',
                                'title': 'Fresh Breeze',
                                'price': '88\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Fresh-Dewy.png',
                                'title': 'Fresh Dewy',
                                'price': '90\$',
                                'bestSeller': true
                              },
                            ],
                          ),
                          makeBestCategory(
                            image: 'assets/images/vanillar.png',
                            title: 'Vanilla',
                            products: [
                              {
                                'image': 'assets/images/Vanilla-Fantasy.png',
                                'title': 'Vanilla Fantasy',
                                'price': '75\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Vanilla-Delight.png',
                                'title': 'Vanilla Delight',
                                'price': '105\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Vanilla-Black.png',
                                'title': 'Vanilla Black',
                                'price': '60\$',
                                'bestSeller': true
                              },
                            ],
                          ),
                          makeBestCategory(
                            image: 'assets/images/elegantr.png',
                            title: 'Elegant',
                            products: [
                              {
                                'image': 'assets/images/Elegant-Luxe.png',
                                'title': 'Elegant Luxe',
                                'price': '105\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Elegant-Majestic.png',
                                'title': 'Elegant Majestic Aura',
                                'price': '200\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Elegant-Royal.png',
                                'title': 'Elegant Royal Ambrosia',
                                'price': '150\$',
                                'bestSeller': true
                              },
                            ],
                          ),
                          makeBestCategory(
                            image: 'assets/images/powderr.png',
                            title: 'Powder',
                            products: [
                              {
                                'image': 'assets/images/Powder-Petals.png',
                                'title': 'Powder Petals',
                                'price': '130\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Powder-Silk.png',
                                'title': 'Powder Silk',
                                'price': '88\$',
                                'bestSeller': true
                              },
                              {
                                'image': 'assets/images/Powder-Soft.png',
                                'title': 'Powder Soft',
                                'price': '77\$',
                                'bestSeller': true
                              },
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeCategory(
      {required String image,
      required String title,
      required String tag,
      required List<Map<String, dynamic>> products}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPage(
                  image: image,
                  title: title,
                  tag: tag,
                  products: products,
                ),
              ),
            );
          },
          child: Material(
            child: Container(
              margin: EdgeInsets.only(right: 20),
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
                      Colors.black.withOpacity(.0),
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeBestCategory(
      {required String image,
      required String title,
      required List<Map<String, dynamic>> products}) {
    return AspectRatio(
      aspectRatio: 3 / 2.2,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryPage(
                image: image,
                title: title,
                tag: title, // Using title as the tag for simplicity
                products: products,
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(right: 20),
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
                  Colors.black.withOpacity(.0),
                ],
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
