import 'package:bigbucks/colors.dart';
import 'package:bigbucks/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);
  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.blackColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome to Big Moni',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
                color: CustomColors.whiteColor,
              ),
            ),
            SizedBox(height: size.height / 9),
            Image.asset(
              'assets/images/bigmoni.png',
              height: 340,
              width: 340,
            ),
            SizedBox(height: size.height / 9),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                style: TextStyle(color: CustomColors.whiteColor),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.75,
              child: ElevatedButton(
                onPressed: () => navigateToLoginScreen(context),
                style: ElevatedButton.styleFrom(
                  primary: CustomColors.whiteColor,
                ),
                child: const Text(
                  'AGREE AND CONTINUE',
                  style: TextStyle(color: CustomColors.blackColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
