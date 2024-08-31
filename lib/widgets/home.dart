import 'package:animate_do/animate_do.dart';
import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/cubits/food_cubit/food_cubit_cubit.dart';
import 'package:audio_to_text_app/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeInLeft(child: _buildDiscountCard('25%', 'sushi', '25th Dec,2023')),
                  FadeInRight(child: _buildDiscountCard('50%', ' Mac n Cheese', '25th Dec,2023')),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Card(
              color: Color(0xff333333),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Use code',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      'ilovemyfood',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 24),
                    ),
                    Row(
                      children: [
                        Text(
                          'to get',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          ' 10% off ',
                          style: TextStyle(color: kprimarycolor, fontSize: 18),
                        ),
                        Text(
                          'on your order',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const TabBar(
              tabs: [
                Tab(
                  text: 'Foods',
                ),
                Tab(
                  text: 'Drinks',
                ),
                Tab(
                  text: 'Snaks',
                ),
                Tab(
                  text: 'Sauce',
                ),
              ],
              indicatorColor: Color(0xffFA4A0C),
              labelColor: Color(0xffFA4A0C),
            ),
            SizedBox(
              height: 380,
              child:  TabBarView(
                children: [
                  CustomListView(
                    type: 'food',
                  ),
                  CustomListView(
                    type: 'drink',
                  ),
                  CustomListView(
                    type: 'snack',
                  ),
                  CustomListView(
                    type: 'sauce',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscountCard(String discount, String foodname, String date) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: kprimarycolor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                discount,
                style:
                    const TextStyle(fontSize: 38, fontWeight: FontWeight.w800),
              ),
              const Text(
                'off',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
          Text(
            'on all $foodname orders across app*',
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          Text('valid till $date'),
        ],
      ),
    );
  }
}
