import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/service_bloc/service_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/widgets/signup_screen/service.dart';


  Container servicePicker() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: cyanColor, width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ServiceBloc, ServiceBlocState>(
          builder: (context, state) {
            if (state is ServiceBlocInitial) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myFont("This can be modified later after registeration",
                      fontFamily: balooChettan,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      fontColor: greyColor,
                      textalign: TextAlign.start),
                  const SizedBox(
                    height: 3,
                  ),
                  registerServices(context, "HAIRCUT         ",
                      state.switches["haircut"]!, "haircut"),
                  registerServices(context, "FACIAL             ",
                      state.switches["facial"]!, "facial"),
                  registerServices(context, "STRAIGHTEN ",
                      state.switches["straighten"]!, "straighten"),
                  registerServices(context, "MASSAGE       ",
                      state.switches["massage"]!, "massage"),
                  registerServices(context, "BEARD TRIM ",
                      state.switches["beard trim"]!, "beard trim"),
                  registerServices(context, "SHAVE             ",
                      state.switches["shave"]!, "shave")
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
