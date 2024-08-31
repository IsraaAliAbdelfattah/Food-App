import 'package:audio_to_text_app/models/food_model.dart';
import 'package:audio_to_text_app/widgets/counter_widget.dart';
import 'package:flutter/material.dart';


class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.meals});
final FoodModel meals;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
            ClipOval(
              child: Image.asset(meals.image,
              height: 80,
              width: 80,
              fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 20,),
             Column(
              children: [
                Text(meals.foodName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                ),
                const Text('view details',
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w300,
                  
                ),),
                Text(meals.price,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffFF470B),
                ),
                ),
              ],
            ),
            //*******************Counter **************************
            const Spacer(),
             CounterWidget(
              meal: meals,
            ),

            
          ],),
        ),
      ),
    );
  }
}