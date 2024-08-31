import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetstartedView extends StatefulWidget {
  const GetstartedView({super.key});

  @override
  State<GetstartedView> createState() => _GetstartedViewState();
}

class _GetstartedViewState extends State<GetstartedView> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => 
            //const CustomBottomNavigationBar()
            const Login()
            ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimarycolor,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.sizeOf(context).height / 1.6,
            right: MediaQuery.sizeOf(context).width / 6,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  //must edit
                  minimumSize: const Size(250, 20),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: Text(
                  "Yum Bites",
                  style: GoogleFonts.fingerPaint(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                )),
          ),
          backgroundPhoto(
              image: coffeeimag,
              top: 5,
              left: MediaQuery.sizeOf(context).width / 1.3,
              height: 180,
              width: 100),
          backgroundPhoto(
              image: burgerimag,
              top: MediaQuery.sizeOf(context).height / 8,
              right: MediaQuery.sizeOf(context).width / 3.3,
              height: 300,
              width: 400),
          backgroundPhoto(
            image: saladimag,
            top: MediaQuery.sizeOf(context).height / 2.7,
            right: MediaQuery.sizeOf(context).width / 2.8,
            height: 400,
            width: 300,
          ),
          backgroundPhoto(
              image: tacoimag,
              top: MediaQuery.sizeOf(context).height / 1.57,
              right: MediaQuery.sizeOf(context).width / 2.1,
              height: 400,
              width: 231),
          backgroundPhoto(
              image: noodelsimag,
              top: MediaQuery.sizeOf(context).height / 2.2,
              left: MediaQuery.sizeOf(context).width / 3.7,
              height: 500,
              width: 400),
          backgroundPhoto(
              image: iceCreamImage,
              top: MediaQuery.sizeOf(context).height / 9,
              left: MediaQuery.sizeOf(context).width / 5,
              height: 400,
              width: 400),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 30,
            left: 15,
            child: const Text(
              'Food  ',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 10,
            left: 15,
            child: const Text(
              'For Everyone',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  // fontWeight: FontWeight.bold

                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget backgroundPhoto(
      {required String image,
      required double top,
      required double height,
      required double width,
      double? left,
      double? right}) {
    return Positioned(
        top: top,
        left: left,
        right: right,
        child: SizedBox(
          child: Image.asset(
            image,
            height: height,
            width: width,
          ),
        ));
  }
}
