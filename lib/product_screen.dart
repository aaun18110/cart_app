import 'package:cart_app/cart_screen.dart';
import 'package:cart_app/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shared_preferences/shared_preferences.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  SharedPref sp = SharedPref();
  List<String> productName = [
    'Mango',
    'Orange',
    'Grapes',
    'Banana',
    'Cherry',
    'Peach',
    'Gauva'
  ];
  List<String> productUnit = ['Kg', 'Dozen', 'Kg', 'Dozen', 'Kg', 'Kg', 'Kg'];
  List<String> productPrice = ['110', '100', '200', '120', '150', '80', '100'];
  List<String> productImage = [
    'image/mango.jpg',
    'image/orange.jpg',
    'image/grapes.jpg',
    'image/banan.png',
    'image/cherry.png',
    'image/peach.jpg',
    'image/gauva.jpg'
  ];

  int counter = 0;

  @override
  void initState() {
    super.initState();

    sp.getCount();
    setState(() {});
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveData() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setStringList('name', productName);
    prefs.setStringList('price', productPrice);
    prefs.setStringList('unit', productUnit);
    prefs.setStringList('image', productImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Menu'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            child: Center(
              child: badges.Badge(
                  badgeContent: Text(sp.getCount().toString()),
                  animationDuration: const Duration(milliseconds: 300),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 28,
                  )),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: productName.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image(
                                width: 100,
                                height: 100,
                                image:
                                    AssetImage(productImage[index].toString())),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productName[index].toString(),
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "${productPrice[index]} Rs/-",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                productUnit[index].toString(),
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              print('data');
                              saveData();
                              setState(() {
                                sp.addCount();
                              });
                            },
                            child: Container(
                              width: 110,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade500,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
