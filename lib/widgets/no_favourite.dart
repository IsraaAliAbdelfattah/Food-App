import 'package:flutter/material.dart';

class NoFavourite extends StatelessWidget {
  const NoFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width/5.5,vertical:MediaQuery.sizeOf(context).height/10,),
        child: Column(
          children: [
            Image.asset('assets/images/macaroon_ 1.png',height: 174,width: 195,),
            
            const Text('No Favourite yet',style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 28,
            ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
           
          ],
        ),
      );
  }
}