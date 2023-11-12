import 'package:ecom2/components/my_button.dart';
import 'package:ecom2/models/product.dart';
import 'package:ecom2/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  
void payNowButton(BuildContext context){
showDialog(context: context, builder: (context)=> const AlertDialog(
  content: const Text("Take it without paying it's free for you..."),
),
);

}
  void removeItemFromCart (BuildContext context,Product product){
    // show a dialog box to confirm from the user
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: const Text("Remove this to your cart?"),
      actions: [
        // cancel button
        MaterialButton(
          onPressed:()=>Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        // yes button
        MaterialButton(
          onPressed: (){
            Navigator.pop(context);

// reomove from cart
            context.read<Shop>().removeFromCart(product);
          },
          child: const Text("Remove"),
        )
      ],
    ),
    );
  }
  @override
  Widget build(BuildContext context) {

    // for accessing the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const  Text("Cart"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
children: [
  Expanded(
    child: cart.isEmpty ?
        const Center(
          child: Text("Your cart is Empty"),
        )
    :ListView.builder(
      itemCount: cart.length,
        itemBuilder:(context,index){
          // get individual  item in the cart
          final item = cart[index];

          //return a cart item tile
          return  ListTile(
            title: Text(item.name),
            subtitle: Text('\$' + item.price.toStringAsFixed(2)),
              trailing: IconButton(
                icon: const Icon(Icons.remove),
                onPressed:()=>removeItemFromCart(context,item),
              ),
            );
        },
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(50),
    child: cart.isEmpty ? MyButton(onTap: ()=>Navigator.pushNamed(context, "/shop"), child: Text("Back To Shop")) :MyButton(onTap: ()=>payNowButton(context), child: Text("PAY NOW")),
  )
],
      ),
    );
  }
}
