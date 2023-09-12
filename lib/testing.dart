import 'package:flutter/material.dart';

import 'core/constants/imgaeasset.dart';

class Testing extends StatelessWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: 150,
              child: Image.asset(AppImageAsset.logo, height: 120),
            ),
            Image.asset(
              'assets/images/home.png',
              color: Colors.amber,
              height: 40,
              width: 40,
            )
          ],
        ),
      ),
    );
  }
}
