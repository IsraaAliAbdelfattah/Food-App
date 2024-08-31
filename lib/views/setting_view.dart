import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/cubits/themescubit/cubit/app_theme_cubit.dart';
import 'package:audio_to_text_app/enums/enums_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Account',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            buildAccountoption(context, 'ChangePassword'),
            buildAccountoption(context, 'Content Settings'),
            buildAccountoption(context, 'Social'),
            buildAccountoption(context, 'Language'),
            buildAccountoption(context, 'Praivcy and Security'),
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: kprimarycolor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountoption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(title),
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Option1'),
                    Text('Option2'),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('close')),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600]),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
