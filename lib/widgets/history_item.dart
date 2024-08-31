import 'package:audio_to_text_app/widgets/history_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text('My History',
          style: TextStyle(
              fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Date : 30 / 8 /2024'),
         HistoryListview()
         
        ],
      ),
    );
  }
}