import 'package:ecom2/components/my_drawer.dart';
import 'package:ecom2/components/my_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access the methods and function in shop class
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        title: Text("JShop"),
      centerTitle: true,
      backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: ()=>Navigator.pushNamed(context, "/cart"),
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      drawer: const  MyDrawer(),
      body: ListView(
        children:[
          const SizedBox(height: 25,),
          Center(
            child: Text("Pick from a selected list of premium products ",style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary
            ),),
          ),

      SizedBox(
        height: 550,
        child: ListView.builder(
          padding: const EdgeInsets.all(15),
          // for scroll direction
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context,index){
          final product = products[index];
          // return a product tile
            return MyProduct(product: product);
        },
        ),
      ),
      ],
    ),
    );
  }
}
