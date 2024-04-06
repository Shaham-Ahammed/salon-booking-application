
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/image_bloc/image_bloc.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/signup_screen_constants.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class ShopImageError extends StatelessWidget {
  const ShopImageError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: registerButtonPressed,
      builder: (context, value, child) => 
       BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          if (state.ShopImageImagePath.isEmpty && value 
            ) {
            return Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: mediaqueryHeight(0.02, context),
                    top: mediaqueryHeight(0.007, context)),
                child: Text(
                  "upload shop image",
                  style: TextStyle(
                    color: Colors.red.shade800,
                    fontSize: 13.0,
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}