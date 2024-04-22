import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ShopImageDisplay extends StatelessWidget {
  const ShopImageDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(25)),
      child: Image.asset(
        fit: BoxFit.cover,
        "assets/images/shop_image.jpg",
        height: mediaqueryHeight(0.28, context),
        width: double.infinity,
      ),
    );
  }
}
