import 'package:audio_to_text_app/constant.dart';
import 'package:flutter/material.dart';



class NormalTextFieldWidget extends StatelessWidget {
  const NormalTextFieldWidget(
      {super.key, required this.text, required this.hinttext, this.onChanged, required this.mycontraller});
  final String hinttext;
  final String text;
  final TextEditingController mycontraller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          TextFormField(
            controller: mycontraller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'value is required';
              }
              return null;
            },
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hinttext,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                  color: kprimarycolor,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              hintStyle: const TextStyle(color: kprimarycolor),
              filled: true,
              fillColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
