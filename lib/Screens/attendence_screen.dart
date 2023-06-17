import 'package:flutter/material.dart';
import 'package:flutter_ams_project_ai/widgets/app_bar_text.dart';

class AttendenceScreen extends StatefulWidget {
  final String username;
  final String imagePath;

  const AttendenceScreen(
    this.username, {
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
  List<String> loggedInUsers = [];
  void addUser(String username) {
    setState(() {
      loggedInUsers.add(username);
    });
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(text: "Records"),
        centerTitle: true,
      ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      //     child: ListView.builder(
      //       scrollDirection: Axis.vertical,
      //       shrinkWrap: true,
      //       itemCount: loggedInUsers.length,
      //       itemBuilder: (context, index) {
      //         return ListTile(
      //           title: Text(loggedInUsers[index]),
      //         );
      //       },
      //     ),
      //   ),
      // ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/images/congrats.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
