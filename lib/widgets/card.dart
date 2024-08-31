import 'package:flutter/material.dart';

class FoodItemCard extends StatelessWidget {
  final String image;
  final String foodName;
  final String price;

  const FoodItemCard({super.key, 
    required this.image,
    required this.foodName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Card Container
          Container(
            width: 156,
            height: 200, // Ensure this height is sufficient
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: SizedBox(
               width: 156,
            height: 900,
              child: Column(
                children: [
                  const SizedBox(height: 60), // Space for the image container
                  Text(
                    foodName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned Image
          Positioned(
            top: -50, // Adjust this value to position the image correctly
            left: 22
            , // Center the image
            child: ClipOval(
              child: Image.asset(
                image,
                height: 100, // Adjust the size of the image as needed
                width: 100, // Adjust the size of the image as needed
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
