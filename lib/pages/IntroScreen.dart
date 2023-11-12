import 'package:ecom2/components/my_button.dart';
import 'package:flutter/material.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
Icon(
  Icons.shopping_bag,
  size: 72,
  color:Theme.of(context).colorScheme.inversePrimary,
),
            // for spacing
            const SizedBox(height: 25,),
            //title
Text("Minimal E-shop",style: TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 24
),),

            // for spacing
            const SizedBox(height: 10,),

            //subtitle
Text("Premium Quality Goods",
style: TextStyle(
  color: Theme.of(context).colorScheme.inversePrimary,
),),
            const SizedBox(height: 25,),

            //button
            MyButton(onTap: ()=> Navigator.pushNamed(context,'/shop'),
                child: const  Icon(Icons.arrow_forward),
            )

          ],
        ),
      ),
    );
  }
}
