import 'package:animate_do/animate_do.dart';
import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:audio_to_text_app/views/setting_view.dart';
import 'package:audio_to_text_app/widgets/drawer_widget.dart';
import 'package:audio_to_text_app/widgets/home.dart';
import 'package:audio_to_text_app/widgets/no_item_found.dart';
import 'package:audio_to_text_app/widgets/search.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = 'Home Page';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<FoodModel> dishsonsearch = [];
  List<FoodModel> dishs = [
    FoodModel(
        discount: '20',
        discription:
            'A sizzling taste of the salmon with crunchiness of freshly baked veggeis and garnished with cherry tomatoes and basil oil',
        amount: 1,
        image: 'assets/images/spicy_salmon2 (1).png',
        price: 'Rs .199',
        reviews: '4.5/4',
        foodName: 'Spicy Salmon'),
    FoodModel(
        discount: '20',
        discription:
            'A sizzling taste of the salmon with crunchiness of freshly baked veggeis and garnished with cherry tomatoes and basil oil',
        amount: 1,
        image: 'assets/images/spicy_salmon.png',
        price: 'Rs .100',
        reviews: '4.5/4',
        foodName: 'Nodels'),
    FoodModel(
        discount: '20',
        discription:
            'A sizzling taste of the salmon with crunchiness of freshly baked veggeis and garnished with cherry tomatoes and basil oil',
        amount: 1,
        image: 'assets/images/fride_rice (1).png',
        price: 'Rs .200',
        reviews: '4.5/4',
        foodName: 'Fride Rice'),
    FoodModel(
        discount: '20',
        discription:
            'A sizzling taste of the salmon with crunchiness of freshly baked veggeis and garnished with cherry tomatoes and basil oil',
        amount: 1,
        image: 'assets/images/rice_bowl.png',
        price: 'Rs .300',
        reviews: '4.5/4',
        foodName: 'Rice Bowl'),
    FoodModel(
        discount: '20',
        discription:
            'A sizzling taste of the salmon with crunchiness of freshly baked veggeis and garnished with cherry tomatoes and basil oil',
        amount: 1,
        image: 'assets/images/rice_rasam.png',
        price: 'Rs .250',
        reviews: '4.5/4',
        foodName: 'Rice Rasam'),
    FoodModel(
        discount: '20',
        discription:
            'A sizzling taste of the salmon with crunchiness of freshly baked veggeis and garnished with cherry tomatoes and basil oil',
        amount: 1,
        image: 'assets/images/fride_rice.png',
        price: 'Rs .350',
        reviews: '4.5/4',
        foodName: 'Fride Rice'),
  ];
  bool ratepressed = false;
  bool textfieldpressed = false;

  TextEditingController mycontraller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: scaffoldprimarycolor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: FadeInDown(
            child: Container(
              padding: const EdgeInsets.only(top: 1.5),
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: mycontraller,
                      onChanged: (value) {
                        searchMeal(value);
                        if (mycontraller.text.isNotEmpty) {
                          textfieldpressed = true;
                          setState(() {});
                        }
                        if (mycontraller.text.isEmpty) {
                          textfieldpressed = false;
                          setState(() {});
                        }
                      },
                      style:const TextStyle(
                        color: Colors.black87
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 136, 134, 134),
                        ),
                        prefixIcon: IconButton(
                          padding: const EdgeInsets.only(bottom: 1.9),
                          onPressed: () {},
                          icon: const Icon(Icons.search, color: Colors.black54),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/satoro.png',
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            dishsonsearch.isEmpty && textfieldpressed == true
                ? const NoItemFound()
                : textfieldpressed == true
                    ? Search(dishs: dishsonsearch)
                    : const Home(),
          ],
        ),
        drawer: NavBar(
          rateonTap: () async {

          },
          settingonTap: () {

          },
        ),
      ),
    );
  }

  void searchMeal(String query) {
    final suggestions = dishs.where((foodModelList) {
      final foodname = foodModelList.foodName.toLowerCase();
      final input = query.toLowerCase();
      return foodname.contains(input);
    }).toList();
    setState(() {
      dishsonsearch = suggestions;
    });
  }
}
