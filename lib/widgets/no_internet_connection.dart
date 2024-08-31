import 'package:audio_to_text_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key, this.onPressed});
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical:MediaQuery.sizeOf(context).height/9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/Muffin.png',height: 195,width: 189,),
            
            const Text('No internet connection',style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 26,
            ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('your internet connection is currently',style: TextStyle(color: Colors.grey),),
            const Text('not avaliable please check or try again',style: TextStyle(color: Colors.grey)),
            SizedBox(
              height:  MediaQuery.sizeOf(context).height/11,
            ),
             CustomButton(
              onPressed: onPressed,
              text: 'Try again',color: const Color(0xffFA4A0C),)
          ],
        ),
      );
  }
}