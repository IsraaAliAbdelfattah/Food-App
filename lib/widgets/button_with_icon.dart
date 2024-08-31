import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            minimumSize:
                WidgetStateProperty.all(const Size(double.infinity, 50))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/Social_media_logo.svg',
              height: 20,
            ),
            const SizedBox(width: 10,),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins-Bold',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
