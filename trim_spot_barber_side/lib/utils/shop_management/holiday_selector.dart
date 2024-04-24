import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/registration_blocs/holiday_bloc/holiday_bloc_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/registration_page/holidays.dart';
import 'package:trim_spot_barber_side/utils/registration_page/textediting_controllers.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';


class HolidaySelector extends StatelessWidget {
  const HolidaySelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HolidayBloc, HolidayBlocState>(
      builder: (context, state) {
        return SizedBox(
          height: mediaqueryHeight(0.25, context),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: weekDays.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: mediaqueryWidth(0.04, context),
              mainAxisSpacing: mediaqueryHeight(0.03, context),
              childAspectRatio: 2.2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context
                    .read<HolidayBloc>()
                    .add(HolidaysSelected(day: weekDays[index])),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: state.holidays.contains(weekDays[index])
                          ? cyanColor
                          : greyColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: state.holidays.contains(weekDays[index])
                        ? cyanColor
                        : greyColor3,
                  ),
                  child: Center(
                    child: myFont(
                      weekDays[index],
                      fontFamily: balooChettan,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontColor:
                          state.holidays.contains(weekDays[index])
                              ? blackColor
                              : greyColor,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

