import 'package:ecom2/models/product.dart';
import 'package:ecom2/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProduct extends StatelessWidget {
  final Product product;
  const MyProduct({super.key,
  required this.product});
void addToCart(BuildContext context){
  // show a dialog box to confirm fromthe user
  showDialog(context: context, builder: (context)=>AlertDialog(
  content: Text("Add this to your cart?"),
    actions: [
      // cancel button
      MaterialButton(onPressed:()=>Navigator.pop(context),
      child: Text("Cancel"),),
      // yes button
      MaterialButton(
          onPressed: (){
Navigator.pop(context);

//add to cart
          context.read<Shop>().addToCart(product);
          },
        child: Text("Yes"),
      )
    ],
  ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
Column(
  children: [
    // image
    AspectRatio(
      aspectRatio: 1,
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12)
          ),

          width: double.infinity,

          padding: const EdgeInsets.all(25),

          child: Image.asset(product.image),
    ),
    ),
    const SizedBox(height: 25,),
    // name
    Text(product.name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),),
    const SizedBox(height: 10,),

    // description
    Text(product.description, style:  TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    ),),
  ],
),

          const SizedBox(height: 25,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
  Text('\$ ' + product.price.toStringAsFixed(2)),
Container(
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.secondary,
    borderRadius: BorderRadius.circular(12),
  ),
  child: IconButton(
    onPressed: ()=>addToCart(context),
    icon: const Icon(Icons.add),
  ),
),
],
)
          // price + add to cart button

        ],
      ),
    );
  }
}
