import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_bloc/registration_bloc.dart';
import 'package:trim_spot_barber_side/reusable_widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable_widgets/font.dart';
import 'package:trim_spot_barber_side/reusable_widgets/mediaquery.dart';

class HolidayPicker extends StatelessWidget {
  const HolidayPicker({
    super.key,
    required this.weekDays,
    required this.state,
  });

  final List<String> weekDays;
  final RegisterFormInitial state;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaqueryHeight(0.05, context),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => context
                  .read<RegisterFormBloc>()
                  .add(HolidaysSelected(day: weekDays[index])),
              child: Container(
                  height: mediaqueryHeight(0.02, context),
                  width: mediaqueryWidth(0.27, context),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: state.holidays.contains(weekDays[index])
                              ? cyanColor
                              : greyColor,
                          width: 2),
                      borderRadius: BorderRadius.circular(90),
                      color: state.holidays.contains(weekDays[index])
                          ? cyanColor
                          : greyColor3),
                  child: Center(
                    child: myFont(weekDays[index],
                        fontFamily: balooChettan,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontColor: state.holidays.contains(weekDays[index])
                            ? blackColor
                            : greyColor),
                  )),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: mediaqueryWidth(0.04, context),
              ),
          itemCount: 7),
    );
  }
}

