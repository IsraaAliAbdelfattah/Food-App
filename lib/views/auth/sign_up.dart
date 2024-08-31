import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/widgets/awesomedialog.dart';
import 'package:audio_to_text_app/widgets/bottom_navigation_bar.dart';
import 'package:audio_to_text_app/widgets/custom_button.dart';
import 'package:audio_to_text_app/widgets/normal_text_field.dart';
import 'package:audio_to_text_app/widgets/password_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
   TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
   TextEditingController address = TextEditingController();
 bool isloading=false;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: kprimarycolor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              const Text(
                'Sign up',
                style: TextStyle(fontSize: 24),
              ),
              NormalTextFieldWidget(
                mycontraller: username,
                text: 'User Name',
                hinttext: 'Enter a valid User name',
                onChanged: (data) {
                  username.text = data;
                },
              ),
              NormalTextFieldWidget(
                mycontraller: email,
                text: 'Email',
                hinttext: 'Enter a valid Email',
                onChanged: (data) {
                  email.text = data;
                },
              ),
              NormalTextFieldWidget(
                mycontraller: address,
                text: 'Address',
                hinttext: 'Enter a valid address',
                onChanged: (data) {
                  address.text = data;
                },
              ),
              PasswordTextFieldWidget(
                mycontraller: password,
                text: 'Password',
                hinttext: 'Password',
                onChanged: (data) {
                  password.text = data;
                },
              ),
              PasswordTextFieldWidget(
                mycontraller: confirmpassword,
                text: 'Confirm Password',
                hinttext: 'Confirm Password',
                onChanged: (data) {
                  confirmpassword.text = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  onPressed: () async{
                    if(formkey.currentState!.validate()){
                      isloading=true;
                      setState(() {
                        
                      });
                      try {
                      await RegisterMethod(context);
                      await awesome_dialog(context,'Email Created Succesfully');
                      
                      Navigator.pushNamedAndRemoveUntil(
                          context,CustomBottomNavigationBar.id, (route) => false);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                          await awesome_dialog(context,'The password provided is too weak.');
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                         await awesome_dialog(context,'The account already exists for that email.');
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                    isloading=false;
                    setState(() {});
                    }
                  },
                  text: 'Sign Up'),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'OR',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins-Regular',
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.grey,
                  )),
                ],
              ),
              CustomButton(
                text: 'Sign in',
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
   Future<void> RegisterMethod(BuildContext context) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text!,
      password: password.text!,
    );
  }
}
