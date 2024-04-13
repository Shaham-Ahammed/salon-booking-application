import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_image_bloc/profile_image_bloc.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/register_page/valuenotifier.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/background_image.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/textformfields.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/register_button.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/sizedbox.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/welcome.dart';
class ProfileImageError extends StatelessWidget {
  const ProfileImageError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pressedSubmitButton,
      builder: (context, value, child) {
        return BlocBuilder<ProfileImageBloc, ProfileImageState>(
          builder: (context, state) {
            if (value && state.imagePath.isEmpty) {
              return Column(
                children: [
                  SizedBox(
                    height: mediaqueryHeight(0.01, context),
                  ),
                  Text(
                    "upload profile image",
                    style: TextStyle(
                      color: Colors.red.shade800,
                      fontSize: 13.0,
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        );
      },
    );
  }
}
