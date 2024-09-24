import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CartModel.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/back2.jpeg',
              fit: BoxFit.cover,
            ),
          ),

          ListView.builder(
            itemCount: cart.cartItems.length,
            itemBuilder: (context, index) {
              final shoe = cart.cartItems[index];
              return Card(
                color: const Color.fromARGB(239, 18, 19, 19),
                elevation: 10,
                shadowColor: const Color.fromARGB(239, 56, 229, 241),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        shoe.imageUrl,  // Corrected this line
                        width: 200,
                        height: 200,
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            shoe.name,
                            style: const TextStyle(color: Colors.white,
                            fontSize: 25,
                            ),
                          ),
                          subtitle: Text(
                            '\$${shoe.price.toString()}',
                            style: const TextStyle(color: Colors.white,
                            fontSize: 20,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              cart.removeFromCart(shoe);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(179, 0, 0, 0),
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}
