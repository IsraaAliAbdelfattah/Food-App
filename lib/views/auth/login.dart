import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/views/auth/sign_up.dart';
import 'package:audio_to_text_app/widgets/awesomedialog.dart';
import 'package:audio_to_text_app/widgets/bottom_navigation_bar.dart';
import 'package:audio_to_text_app/widgets/button_with_icon.dart';
import 'package:audio_to_text_app/widgets/custom_button.dart';
import 'package:audio_to_text_app/widgets/normal_text_field.dart';
import 'package:audio_to_text_app/widgets/password_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static String id = 'Log In';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isChecked = false;
  bool isloading=false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
GlobalKey <FormState> formkey = GlobalKey();
 

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: kprimarycolor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 10,
              ),
              const Row(
                children: [
                  Text(
                    'Sign in',
                    style: TextStyle(fontSize: 24),
                  ),
                  Spacer(),
                  Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
               NormalTextFieldWidget(
                mycontraller: email,
                 onChanged: (value) {
                      email.text = value.trim();
                    },
                text: 'Email', 
                hinttext: 'Enter Email'),
               PasswordTextFieldWidget(
                mycontraller: password,
                 onChanged: (value) {
                      password.text = value.trim();
                    },
                  text: 'Password', 
                  hinttext: 'Enter Password'),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Transform.scale(
                    scale: .8,
                    child: Checkbox(
                      side: const BorderSide(
                        color: Colors.white,
                        width: 1.2,
                      ),
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Poppins-Regular',
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  onPressed: ()async {
                   if(formkey.currentState!.validate()){
                      setState(() {
                         isloading=true;
                      });
                      try {
                        // Good Night
                        
                      await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(email: email.text!, password: password.text!);
                                      await  FirebaseAuth.instance.currentUser!.reload();
                       await awesome_dialog(context,'LOGEDIN Successfully');
                                         setState(() {});
                      Navigator.pushNamedAndRemoveUntil(
                          context, CustomBottomNavigationBar.id, (route) => false);
                    } on FirebaseAuthException catch (e) {
                     
                          print(e);
                           await awesome_dialog(context,e.toString());
                    }
                   
                     catch (e) {
                      print(e);
                       await awesome_dialog(context,e.toString());
                    }
                    isloading=false;
                     setState(() {
                        
                      });
                    }
                  },
                 
                  text: 'Sign in'),
              const SizedBox(
                height: 10,
              ),
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
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignUp()));
                  },
                  text: 'Create an account'),
              const SizedBox(
                height: 10,
              ),
              const ButtonWithIcon(text: 'Continue with google')
            ],
          ),
        ),
      ),
    );
  }


}
