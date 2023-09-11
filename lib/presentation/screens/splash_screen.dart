import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, '/characters_screen');
    });

    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Image.asset(
                'assets/images/ss.png',
                fit: BoxFit.contain,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 120.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  color: MyColors.myYellow,
                  strokeWidth: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
