import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.color,
      this.textStyle,
      this.addtocartpress,
      });
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final void Function()? onPressed;
final bool? addtocartpress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: color == null
                ? WidgetStateProperty.all(Colors.black)
                :addtocartpress==true? WidgetStateProperty.all(const Color(0xff12AB3D)):WidgetStateProperty.all(color),
            minimumSize:
                WidgetStateProperty.all(const Size(double.infinity, 50))),
        child:addtocartpress==true? const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline,color: Colors.black,),
             Text('Added', style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),)
          ],
        ):Text(
          text,
          style:textStyle ?? const TextStyle(
              fontSize: 18, 
              color: Colors.white, 
              fontFamily: 'Poppins-Regular'),
        ),
      ),
    );
  }
}
