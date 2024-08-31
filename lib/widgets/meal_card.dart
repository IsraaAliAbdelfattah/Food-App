import 'package:animate_do/animate_do.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:flutter/material.dart';


class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal, this.onTap});
final FoodModel meal; 
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(top:MediaQuery.sizeOf(context).height/7),
                    child: Card(
                      color: Colors.white,
                      child:  Column(
                        children: [
                          Text(
                            meal.foodName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            meal.price,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFF470B),
                            ),
                          ),
                          Text(
                            meal.reviews,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
              top: MediaQuery.sizeOf(context).height/35,
              right: MediaQuery.sizeOf(context).width/20, 
              child: 
              ClipOval(
                child: Image.asset(meal.image,
                height: 150,
                width: 150,
                fit: BoxFit.fill,
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}