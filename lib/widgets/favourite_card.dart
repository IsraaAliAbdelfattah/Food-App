import 'package:audio_to_text_app/models/food_model.dart';
import 'package:flutter/material.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({super.key, required this.meals});
final FoodModel meals;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
                  fontSize: 20,
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
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffFF470B),
                ),
                ),
              ],
            ),
          
            
            
          ],),
        ),
      ),
    );
  }
}