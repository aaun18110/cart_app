import 'package:cart_app/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  static Future<List<List<String>>> loadData() async {
    final SharedPreferences prefs = await _prefs;
    final list1 = prefs.getStringList('name') ?? [];
    final list2 = prefs.getStringList('price') ?? [];
    final list3 = prefs.getStringList('unit') ?? [];
    final list4 = prefs.getStringList('image') ?? [];
    return [list1, list2, list3, list4];
  }

  @override
  Widget build(BuildContext context) {
    SharedPref sp = SharedPref();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart Menu'),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
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
            FutureBuilder(
              future: loadData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final lists = snapshot.data as List<List<String>>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: lists.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data![index].first.toString()),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ));
  }
}
