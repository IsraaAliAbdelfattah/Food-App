import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/views/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/themescubit/cubit/app_theme_cubit.dart';
import '../enums/enums_theme.dart';
import '../views/setting_view.dart';



class NavBar extends StatefulWidget {
  const NavBar({super.key, this.rateonTap, this.settingonTap});
final void Function()? rateonTap;
final void Function()? settingonTap;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool valnotify1 = false;

  onChangedFunction1(bool newvalue) {
    setState(() {
      valnotify1 = newvalue;
      if (valnotify1) {
        BlocProvider.of<AppThemeCubit>(context).changeTheme(ThemeState.dark);
      } else {
        BlocProvider.of<AppThemeCubit>(context).changeTheme(ThemeState.light);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Drawer(
          backgroundColor: kprimarycolor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: ListView(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SettingView()));
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  leading: const Icon(Icons.qr_code),
                  title: const Text('Scan code'),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  leading: const Icon(Icons.account_balance_wallet),
                  title: const Text('Wallet'),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  leading: const Icon(Icons.local_offer),
                  title: const Text('Offer'),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  leading: const Icon(Icons.call),
                  title: const Text('Help'),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  leading: const Icon(Icons.star_rate_outlined),
                  title: const Text('Rate the app'),
                  onTap: widget.rateonTap,
                ),
                 ListTile(
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  leading: const Icon(Icons.logout),
                  title: const Text('LogOut'),
                  onTap: (){
                    FirebaseAuth.instance.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                  },
                ),
                buildNotificationoption('DarkThem', valnotify1, onChangedFunction1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding buildNotificationoption(
      String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          Transform.scale(
            scale: .7,
            child: CupertinoSwitch(
              activeColor: kprimarycolor,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newvalue) {
                onChangeMethod(newvalue);
              },
            ),
          )
        ],
      ),
    );
  }
}
