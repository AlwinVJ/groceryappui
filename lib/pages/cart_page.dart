import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
       ),
      body: Consumer<CartModel>(builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text('My Cart',style: GoogleFonts.notoSerif(
              fontSize: 36,
              fontWeight: FontWeight.bold
              ),),),
            Expanded(
                child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: const EdgeInsets.all(12.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Image.asset(
                              value.cartItems[index][2],
                              height: 36,
                            ),
                            title: Text(value.cartItems[index][0]),
                            subtitle: Text('₹${value.cartItems[index][1]}'),
                            trailing: IconButton(
                                onPressed: () => Provider.of<CartModel>(context,
                                        listen: false)
                                    .removeItemsFromCart(index),
                                icon: const Icon(Icons.cancel)),
                          ),
                        ),
                      );
                    })),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: const BoxDecoration(color: Colors.green),
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(color: Colors.green[100]),
                        ),
                        Text('₹${value.calculateTotal()}')
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12.0)
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child:Row(
                        children:const [
                          Text('Pay Now',style: TextStyle(color: Colors.white)),
                          Icon(Icons.arrow_forward_ios,size: 16,color:Colors.white),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
