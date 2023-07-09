import 'package:flutter/material.dart';
import 'package:gorcery_app/Models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Cart'),
          centerTitle: true,
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 8,
                                  color: Colors.black54,
                                  offset: Offset(1, 4),
                                  spreadRadius: 3),
                            ],
                          ),
                          child: ListTile(
                            leading: Image.asset(value.cartItems[index][2],
                                scale: 5),
                            title: Text(
                              value.cartItems[index][0],
                              style: TextStyle(fontSize: 18),
                            ),
                            subtitle: Text("\$" + value.cartItems[index][1],
                                style: TextStyle(fontSize: 16)),
                            trailing: IconButton(
                              onPressed: () {
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemsFromCart(index);
                              },
                              icon: Icon(Icons.cancel, color: Colors.white),
                              hoverColor: value.cartItems[index][3],
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 12, right: 12, top: 14, bottom: 3),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.teal,
                        Colors.greenAccent,
                        Colors.yellow,
                        Colors.orange,
                        Colors.redAccent,
                      ]),
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Price ",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Text(
                        "\$ " + value.calculateTotal(),
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
