import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/reusable%20widgets/colors.dart';
import 'package:trim_spot_user_side/reusable%20widgets/mediaquery.dart';

import 'package:trim_spot_user_side/screens/first_presentation_screen/introduction_lists.dart';

class FirstIntroductionPage extends StatefulWidget {
  const FirstIntroductionPage({super.key});

  @override
  State<FirstIntroductionPage> createState() => _FirstIntroductionPageState();
}

class _FirstIntroductionPageState extends State<FirstIntroductionPage> {
  final controller = InroductionItems();
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    print("${4 / 2}");
    return Scaffold(
        body: PageView.builder(
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Align(
                alignment: Alignment.topCenter,
                child: Transform.scale(
                  scale: 1.3,
                  child: Image.asset(
                      height: mediaqueryHeight(0.6, context),
                      width: double.infinity,
                      fit: BoxFit.cover,
                      controller.items[index].imagePath),
                ),
              ),
            ),
            Positioned(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Transform.scale(
                scale: 1.3,
                child: Container(
                  width: double.infinity,
                  height: mediaqueryHeight(0.45, context),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: introductionColor),
                ),
              ),
            ))
          ],
        );
      },
    ));
  }
}
