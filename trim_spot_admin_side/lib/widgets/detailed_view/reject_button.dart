import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_admin_side/blocs/buttons_bloc/decision_making_buttons_bloc.dart';
import 'package:trim_spot_admin_side/data/data_provider/collection_reference.dart';
import 'package:trim_spot_admin_side/data/repository/document_model.dart';

import 'package:trim_spot_admin_side/utils/colors.dart';
import 'package:trim_spot_admin_side/utils/font.dart';
import 'package:trim_spot_admin_side/utils/mediaquery.dart';

class RejectButton extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const RejectButton({
    super.key, required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(90),
      color: redErrorColor,
      child: InkWell(
        hoverColor: Colors.red.shade400,
        borderRadius: BorderRadius.circular(90),
          onTap: ()  {
       context
              .read<DecisionMakingButtonsBloc>()
              .add(RejectButtonPressed(shop.id, context));
        },
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
            height: mediaqueryHeight(0.07, context),
            width: mediaqueryWidth(0.2, context),
            child: Center(
              child: myFont("Reject",
                  fontFamily: balooChettan,
                  fontSize: mediaqueryHeight(0.025, context),
                  fontWeight: FontWeight.w600,
                  fontColor: whiteColor),
            )),
      ),
    );
  }
}