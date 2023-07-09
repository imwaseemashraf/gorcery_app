import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorcery_app/Models/cart.dart';
import 'package:provider/provider.dart';

import '../Widgets/Grocery_Items.dart';
import 'CartPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CartPage()));
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag_outlined),
      ),
      appBar: AppBar(
        title: Text("Grocery App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text('Good Morning'),
            Text(
              "Let's Order Fresh items for you ",
              style: GoogleFonts.notoSerif(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.teal, thickness: 5, endIndent: 230),
            SizedBox(height: 20),
            Text(
              'Fresh items',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                      itemCount: value.shopItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 1.4, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GroceryItemsTile(
                            itemName: value.shopItems[index][0],
                            itemPth: value.shopItems[index][2],
                            itemPrice: value.shopItems[index][1],
                            color: value.shopItems[index][3],
                            onPressed: () {
                              Provider.of<CartModel>(context, listen: false)
                                  .addItemToCart(index);
                            },
                          ),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
