import 'package:audio_to_text_app/cubits/food_cubit/food_cubit_cubit.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, required this.meal});
 final FoodModel meal;
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter =1;
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      color: const Color(0xffFA4A0C)
                    ),
                     child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       IconButton(
                        padding: EdgeInsets.zero,
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        constraints: const BoxConstraints(),
                          onPressed: (){
                            counter>=1?counter--:counter;
                            if(counter==0){
                               widget.meal.delete();
                     BlocProvider.of<FoodCubit>(context).fetchAllMeals();
                            }
                            setState(() {
                              
                            });
                          }, 
                          icon: const Icon(Icons.remove,size: 15, color: Colors.white,)),
                        Text('$counter',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        ),
                        
                           IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                             style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                          onPressed: (){
                            counter++;
                            setState(() {
                              
                            });
                          }, 
                          icon: const Icon(Icons.add,size: 15, color: Colors.white,)),
                      ],
                     ),
                  );
  }
}