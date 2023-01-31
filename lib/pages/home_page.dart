import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/models/cart_model.dart';
import 'package:groceryapp/pages/cart_page.dart';
import 'package:provider/provider.dart';
import '../components/grocey_items_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const CartPage();
          } 
          ));
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 48,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text("Good Morning,")),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                thickness: 4,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Fresh Items",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(12.0),
                    itemCount: value.shopItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1/1.3),
                    itemBuilder: (context, index) {
                      return GroceryItemsTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: (){
                          Provider.of<CartModel>(context,listen: false).addItemsToCart(index);
                        },
                      );
                    });
              },
            ))
          ],
        ),
      ),
    );
  }
}
