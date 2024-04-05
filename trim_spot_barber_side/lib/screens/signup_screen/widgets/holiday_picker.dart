import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/holiday_bloc/holiday_bloc_bloc.dart';
import 'package:trim_spot_barber_side/reusable_widgets/colors.dart';
import 'package:trim_spot_barber_side/reusable_widgets/font.dart';
import 'package:trim_spot_barber_side/reusable_widgets/mediaquery.dart';

class HolidayPicker extends StatelessWidget {
  const HolidayPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    return SizedBox(
      height: mediaqueryHeight(0.05, context),
      child: BlocBuilder<HolidayBloc, HolidayBlocState>(
        builder: (context, state) {
          if (state is HolidayBlocInitial) {
            return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => context
                        .read<HolidayBloc>()
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
                              fontColor:
                                  state.holidays.contains(weekDays[index])
                                      ? blackColor
                                      : greyColor),
                        )),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: mediaqueryWidth(0.04, context),
                    ),
                itemCount: 7);
          }
          return Container();
        },
      ),
    );
  }
}
