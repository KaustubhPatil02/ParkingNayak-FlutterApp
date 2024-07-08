import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:parking_nayak/config/colors_manager.dart';
import 'package:parking_nayak/main.dart';
import 'package:parking_nayak/presentation/pages/auth/auth_screen.dart';
import 'package:parking_nayak/utils/local_storage.dart';

import '../../widgets/custom_button.dart';

class IntroScreen extends ConsumerStatefulWidget {
  const IntroScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IntroScreenState();
}

class _IntroScreenState extends ConsumerState<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SvgPicture.asset(
              //   "./assets/Hello.svg",
              //   height: 18,
              // ),
              Container(
                alignment: Alignment(0, 0),
                child: Stack(
                  children: [
                    Lottie.asset("assets/intro_hello.json"),
                    // Lottie.asset(""),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Center(child: Text("A efficient way to track and maintain ", textAlign: TextAlign.center,style: TextStyle(),)),
              Center(child: Text("records to no-parking violeters ", textAlign: TextAlign.center,style: TextStyle(),)),
              
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment(0, 0.7),
          child: CustomButton(
            primaryColor: ColorManager.primaryColor,
            secondaryColor: ColorManager.secondaryColor,
            width: 300,
            text: "Get Started",
            onPressed: () {
              LocalStorage.isIntro(false);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PhoneAuthPage();
              }));
            },
          ),
        )
      ]),
    );
  }
}
