import 'package:flutter/material.dart';
import 'package:flutter_ams_project_ai/Screens/screens.dart';
import 'package:flutter_ams_project_ai/widgets/custom_button.dart';

import '../Database/database_helper.dart';
import '../locator.dart';
import '../services/services.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  MLService _mlService = locator<MLService>();
  FaceDetectorService _mlKitService = locator<FaceDetectorService>();
  CameraService _cameraService = locator<CameraService>();
  AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  _initializeServices() async {
    await _cameraService.initialize();
    await _mlService.initialize();
    _mlKitService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ).copyWith(top: 30, bottom: 10),
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Material(
              child: Text(
                'What do you want to do?',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              icon: Icons.add_circle_outline,
              text: "Add Attendence",
              onpress: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SignIn(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            CustomButton(
              icon: Icons.app_registration_rounded,
              text: "Register New Face",
              onpress: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SignUp(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            CustomButton(
              icon: Icons.history_rounded,
              text: "View History",
              onpress: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AttendenceHistory(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            CustomButton(
              icon: Icons.delete_outline,
              text: "Clear Database",
              onpress: () {
                DatabaseHelper _dataBaseHelper = DatabaseHelper.instance;
                _dataBaseHelper.deleteAll();
                Navigator.of(context).pop();
                final snackbar = SnackBar(
                  showCloseIcon: true,
                  closeIconColor: Colors.white,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor:
                      Theme.of(context).appBarTheme.backgroundColor,
                  content: Text(
                    'Cleared Database',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
            ),
            const SizedBox(
              height: 5,
            ),
            CustomButton(
              icon: Icons.logout_outlined,
              text: "Log out",
              onpress: () async {
                await authService.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
              },
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
