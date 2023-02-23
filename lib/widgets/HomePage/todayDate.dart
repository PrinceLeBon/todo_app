import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayDate extends StatelessWidget {
  const TodayDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today\'s ${DateFormat('EEEE').format(DateTime.now())}',
          style: const TextStyle(color: Colors.white),
        ),
        Container(
          height: 5,
        ),
        Text(DateFormat('MMM d, yyyy').format(DateTime.now()),
            style: const TextStyle(color: Colors.grey, fontSize: 12))
      ],
    );
  }
}
