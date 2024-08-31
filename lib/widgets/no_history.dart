import 'package:audio_to_text_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';



class NoHistory extends StatelessWidget {
  const NoHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical:MediaQuery.sizeOf(context).height/18,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('History',style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),),
        SizedBox(
          height: MediaQuery.sizeOf(context).height/6,
        ),
            Image.asset('assets/images/cofee1.png',height: 180,width: 179,),
            
            const Text('No orders yet',style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 28,
            ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Hit the orange button down',style: TextStyle(color: Colors.grey),),
            const Text('blew to create an order',style: TextStyle(color: Colors.grey)),
            const SizedBox(
              height: 20,
            ),
            const CustomButton(text: 'Start ordaring',color: Color(0xffFA4A0C),)
          ],
        ),
      );
  }
}