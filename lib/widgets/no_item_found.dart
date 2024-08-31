import 'package:flutter/material.dart';


class NoItemFound extends StatelessWidget {
  const NoItemFound({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width/5.5,vertical:MediaQuery.sizeOf(context).height/10,),
        child: Column(
          children: [
            Image.asset('assets/images/macaroon_ 1.png',height: 174,width: 195,),
            
            const Text('Item not found',style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 28,
            ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Try searching the item with',style: TextStyle(color: Colors.grey),),
            const Text('a different keyword',style: TextStyle(color: Colors.grey)),
           
          ],
        ),
      );
  }
}