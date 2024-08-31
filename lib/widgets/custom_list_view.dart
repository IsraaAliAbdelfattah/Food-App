import 'package:audio_to_text_app/cubits/food_cubit/food_cubit_cubit.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:audio_to_text_app/views/item_page.dart';
import 'package:audio_to_text_app/widgets/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomListView extends StatelessWidget {
   CustomListView({super.key,required this.type});
   final String type;
  final List<FoodModel> food =  [
   FoodModel(discount: '20', discription: 'A sizzling taste of the salmon with crunchiness of freshly baked veggeis and garnished with cherry tomatoes and basil oil', amount: 1, image: 'assets/images/spicy_salmon2 (1).png', price:'Rs .199', reviews: '4.5/4', foodName: 'Spicy Salmon'),
   FoodModel(discount: '20', discription: 'A sizzling taste of the salmon with crunchiness of freshly baked veggeis and garnished with cherry tomatoes and basil oil', amount: 1, image: 'assets/images/spicy_salmon.png', price:'Rs .100', reviews: '4.5/4', foodName: 'Nodels'),
   FoodModel(discount: '20', discription: 'A sizzling taste of the salmon with crunchiness of freshly baked veggeis and garnished with cherry tomatoes and basil oil',amount: 1, image: 'assets/images/fride_rice (1).png', price:'Rs .200', reviews: '4.5/4', foodName: 'Fride Rice'),
   FoodModel(discount: '20', discription: 'A sizzling taste of the salmon with crunchiness of freshly baked veggeis and garnished with cherry tomatoes and basil oil', amount: 1, image:  'assets/images/rice_bowl.png', price:'Rs .300', reviews: '4.5/4', foodName: 'Rice Bowl'),
   FoodModel(discount: '20', discription: 'A sizzling taste of the salmon with crunchiness of freshly baked veggeis and garnished with cherry tomatoes and basil oil', amount: 1, image:  'assets/images/rice_rasam.png', price:'Rs .250', reviews: '4.5/4', foodName: 'Rice Rasam'),
   FoodModel(discount: '20', discription: 'A sizzling taste of the salmon with crunchiness of freshly baked veggeis and garnished with cherry tomatoes and basil oil', amount: 1, image: 'assets/images/fride_rice.png', price:'Rs .350', reviews: '4.5/4', foodName: 'Fride Rice'),

    
  ];
   final List<FoodModel> drink =  [
   FoodModel(discount: '20', discription: 'Choose your favourite fruit flavour or create your unique fresh fruit combination for a refreshing blended drink. Banana (100 Cals), Blackberry (50 Cals), Blueberry (70 Cals), Pineapple (60 Cals), Raspberry (60 Cals) or Strawberry (40 Cals).', amount: 1, image: 'assets/images/Fruit_Freezie&CreamyIcedMochaccino.png', price:'Rs .199', reviews: '4.5/4', foodName: 'Fruit Freezie'),
   FoodModel(discount: '20', discription: 'Our European Coffees are all available decaffeinated.', amount: 1, image: 'assets/images/Cappuccino.png', price:'Rs .100', reviews: '4.5/4', foodName: 'Cappuccino'),
   FoodModel(discount: '20', discription: 'Choose your favourite fruit flavour or create your unique fresh fruit combination for a refreshing blended drink. Banana (100 Cals), Blackberry (50 Cals), Blueberry (70 Cals), Pineapple (60 Cals), Raspberry (60 Cals) or Strawberry (40 Cals).',amount: 1, image: 'assets/images/FRESH_FRUIT_MILKSHAKES.png', price:'Rs .200', reviews: '4.5/4', foodName: 'FRESH FRUIT'),
   FoodModel(discount: '20', discription: 'A sizzling taste of the salmon with crunchiness of freshly baked veggeis and garnished with cherry tomatoes and basil oil', amount: 1, image:  'assets/images/Cafe_Latte.png', price:'Rs .300', reviews: '4.5/4', foodName: 'Cafe Latte'),
   FoodModel(discount: '20', discription: 'Choose your favourite fruit flavour or create your unique fresh fruit combination for a refreshing blended drink. Banana (100 Cals), Blackberry (50 Cals), Blueberry (70 Cals), Pineapple (60 Cals), Raspberry (60 Cals) or Strawberry (40 Cals).', amount: 1, image:  'assets/images/FRUIT_FREEZIES.png', price:'Rs .250', reviews: '4.5/4', foodName: 'FRUIT FREEZIES'),
   FoodModel(discount: '20', discription: 'Orange* Fresh Squeezed from 100% Florida oranges (110 Cals Mango* A burst of Caribbean sunshine (140 Cals)', amount: 1, image: 'assets/images/REFRESHING_JUICES.png', price:'Rs .350', reviews: '4.5/4', foodName: 'REFRESHING JUICES'),
   ];
   final List<FoodModel> snack =  [
   FoodModel(discount: '20', discription: 'Like any “loaded” situation, this hot dog is all about constructing your plate. Split-top buns allow you to hollow out the sides a bit, fitting extra toppings into each bite. A touch of sweetness in the chili balances out the salt from corn nuts and the hot dog, while the sharp bite of pickled jalapeños creates balance. Radishes and sour cream offer a welcome hit of freshness.', amount: 1, image: 'assets/images/UltimateLoaded_ChiliTopped_HotDogs.png', price:'Rs .199', reviews: '4.5/4', foodName: 'Ultimate Loaded Chili-'),
   FoodModel(discount: '20', discription: 'Mixing popcorn with glazed pistachios creates a sweet-salty snack that\'s fantastic with cocktails.', amount: 1, image: 'assets/images/Popcorn_with_SesameGlazedPistachios.png', price:'Rs .100', reviews: '4.5/4', foodName: 'Popcorn with Sesame '),
   FoodModel(discount: '20', discription: '"I\'ve always been a fan of any food high in salt and starch," chef Grant Achatz says, "and soft pretzels right out of the oven are awesome." You can eat these slightly sweet, chewy, dark pretzel sticks plain or with mustard; Achatz goes for ranch dressing.',amount: 1, image: 'assets/images/German_Soft_Pretzel_Sticks.png', price:'Rs .200', reviews: '4.5/4', foodName: 'German Soft Pretzel'),
   FoodModel(discount: '20', discription: 'Cook these classic Buffalo wings in an air fryer or on the stove, then toss them in a buttery hot sauce and serve with creamy blue cheese dressing. If you like extra-crispy wings, fry them for an extra minute or two. Or if you\'re using an air fryer, cook the wings skin-side up to keep the skin as crispy as possible. ', amount: 1, image:  'assets/images/Buffalo_Wings.png', price:'Rs .300', reviews: '4.5/4', foodName: 'Buffalo Wings'),
   FoodModel(discount: '20', discription: 'Chef Zak Pelaccio grew up eating fried pickles in New York\'s Brooklyn Heights neighborhood. He coats his extra-crisp version in panko and fries them in schmaltz (chicken fat), though vegetable oil works well, too. ', amount: 1, image:  'assets/images/Fried_Pickles_with_Spicy_Mayonnaise.png', price:'Rs .250', reviews: '4.5/4', foodName: 'Fried Pickles'),
   FoodModel(discount: '20', discription: 'This simple, 20-minute dip recipe of melted cheese flavored with tomatoes, chiles, onion, and a hit of tequila is just the thing to satisfy a craving for something warm, salty, and gooey.', amount: 1, image: 'assets/images/Queso_Fundido.png', price:'Rs .350', reviews: '4.5/4', foodName: 'Queso Fundido'),
   FoodModel(discount: '20', discription: 'These little sliders are lush, miniature takes on classic New England lobster rolls.', amount: 1, image: 'assets/images/Lobster_Sliders.png', price:'Rs .199', reviews: '4.5/4', foodName: 'Lobster Sliders'),
   FoodModel(discount: '20', discription: 'As pepitas toast, they puff up, forming a light, crisp outer shell and a slightly chewy center. The floral notes of the lime balance the spicy jalapeño, making this a great bar snack to pair with Mexican lagers or tequila-based cocktails.', amount: 1, image: 'assets/images/Jalapeño-Lime_Pepitas.png', price:'Rs .199', reviews: '4.5/4', foodName: 'Jalapeño-Lime Pepitas'),
   ];
   final List<FoodModel> sauce =  [
   FoodModel(discount: '20', discription: '5 Minute Magic Green Sauce – SO AWESOME. Made with easy ingredients like avocado, olive oil, cilantro, lime, garlic, and parsley! Vegan.', amount: 1, image: 'assets/images/Magic_Green_Sauce.png', price:'Rs .199', reviews: '4.5/4', foodName: 'Magic Green'),
   FoodModel(discount: '20', discription: 'This 5 Minute Blender Enchilada Sauce is quick, easy, and full of vegetables! Healthy, easy, homemade enchilada sauce. Enjoy!', amount: 1, image: 'assets/images/Chipotle_Tahini.png', price:'Rs .100', reviews: '4.5/4', foodName: 'Chipotle Tahini'),
   FoodModel(discount: '20', discription: 'This Chipotle Tahini is MAGIC. A creamy tahini base, blended up with garlic and chipotles, and finished with a little orange juice for some sweetness. The best!',amount: 1, image: 'assets/images/Blender_Enchilada.png', price:'Rs .200', reviews: '4.5/4', foodName: ' Blender Enchilada'),
   FoodModel(discount: '20', discription: '5 Minute Vegan Kale Pesto – made with almonds, olive oil, kale, garlic, salt, and lemon juice. Less than 150 calories per serving!', amount: 1, image:  'assets/images/Kale_Pesto.png', price:'Rs .300', reviews: '4.5/4', foodName: 'Kale Pesto'),
   FoodModel(discount: '20', discription: 'The Very Best Peanut Sauce! Smooth, drizzle-able, garlicky, and gingery with a good spicy sesame kick. Perfect for noodles, salads, protein, or as a dipping sauce!', amount: 1, image:  'assets/images/The_Very_Best_Peanut.png', price:'Rs .250', reviews: '4.5/4', foodName: 'The Very Best Peanut '),
   FoodModel(discount: '20', discription: 'Our favorite Roasted Red Pepper Sauce! Top it on eggs, potatoes, sandwiches, pizzas, burgers, salads, bowls, and beyond. YUM', amount: 1, image: 'assets/images/Roasted_Red_Pepper.png', price:'Rs .350', reviews: '4.5/4', foodName: 'Roasted Red Pepper'),
   ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit(),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: type=='food'?food.length
                :type=='drink'?drink.length
                :type=='snack'?snack.length
                :sauce.length,
            itemBuilder: (context, index) {
              return MealCard(
                meal: type=='food'?food[index]
                    :type=='drink'?drink[index]
                    :type=='snack'?snack[index]
                    :sauce[index],
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  ItemPage(
                            meal: type=='food'?food[index]
                                :type=='drink'?drink[index]
                                :type=='snack'?snack[index]
                                :sauce[index],
                          )));
                },
              );
            }),
      ),
    );
  }
}
