import 'package:flutter/material.dart';
import 'package:flutter_ams_project_ai/widgets/app_bar_text.dart';

class FaceRegisterScreen extends StatefulWidget {
  const FaceRegisterScreen({super.key});

  @override
  State<FaceRegisterScreen> createState() => _FaceRegisterScreenState();
}

class _FaceRegisterScreenState extends State<FaceRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText(
          text: 'REGISTER',
        ),
      ),
    );
  }
}
