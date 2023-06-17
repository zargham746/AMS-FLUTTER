import 'package:flutter/material.dart';
import 'package:flutter_ams_project_ai/widgets/app_bar_text.dart';

class AttendenceHistory extends StatefulWidget {
  const AttendenceHistory({super.key});

  @override
  State<AttendenceHistory> createState() => _AttendenceHistoryState();
}

class _AttendenceHistoryState extends State<AttendenceHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText(text: 'HISTORY'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height / 3,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/images/nothing_to_show.png"),
            ),
          ),
        ),
      ),
    );
  }
}
