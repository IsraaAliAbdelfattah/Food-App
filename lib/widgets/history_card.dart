import 'package:audio_to_text_app/models/food_model.dart';
import 'package:flutter/material.dart';


class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.meal});
final FoodModel meal;
  @override
  Widget build(BuildContext context) {
    return  Row(
                    children: [
                      Text(meal.foodName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                      const Spacer(),
                      Text(meal.price,
                        style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFF470B),
                        ),
                      ),
                       const Spacer(),
                      Text(meal.reviews,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFA4A0C),
                      ),
                      ),
                       const Spacer(),
                      Text(meal.amount.toString()),
                    ],
                   );
  }
}