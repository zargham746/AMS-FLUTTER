// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import '../locator.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MLService _mlService = locator<MLService>();
  FaceDetectorService _mlKitService = locator<FaceDetectorService>();
  CameraService _cameraService = locator<CameraService>();

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
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/back.jpg"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          toolbarHeight: MediaQuery.of(context).size.height / 3.6,
          title: const AppBarText(text: 'ATTENDENCE MANAGAMENT SYSTEM'),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showDialog<void>(
                      barrierDismissible: true,
                      context: context,
                      builder: (_) => AnimationLimiter(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 375),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: widget,
                              ),
                            ),
                            children: [
                              const CustomDialog(),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const CustomDialog(),
                      //     IconButton(
                      //       onPressed: () {
                      //         Navigator.of(context).pop();
                      //       },
                      //       icon: const Icon(
                      //         Icons.close,
                      //         color: Colors.black,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    );
                  },
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Lottie.asset(
                      'assets/animations/add-button.json',
                      repeat: false,
                    ),
                  ),
                ),
                const Spacer(),
                const Text('A Project By CS & IT Department'),
                const Text('Faculty of Sciences')
              ],
            ),
          ),
        )),
      ),
    );
  }
}
