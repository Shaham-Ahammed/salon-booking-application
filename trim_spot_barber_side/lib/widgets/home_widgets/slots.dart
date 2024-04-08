import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/home.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/homepage/slo_booking_colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class SlotTiles extends StatelessWidget {
  const SlotTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlotSelectionBloc, SlotSelectionState>(
      builder: (context, state) {
        final event = context.read<SlotSelectionBloc>();
        return SizedBox(
          height: mediaqueryHeight(0.32, context),
          width: double.infinity,
          child: ListView.builder(
            itemCount: (timeSlots.length / 5).ceil(),
            itemBuilder: (BuildContext context, int index) {
              int startIndex = index * 5;
              int endIndex = startIndex + 5 > timeSlots.length
                  ? timeSlots.length
                  : startIndex + 5;
              List<String> timeSlotsRow =
                  timeSlots.sublist(startIndex, endIndex);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: timeSlotsRow.map((time) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: mediaqueryHeight(0.014, context)),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {
                          event.add(SelectedSlot(time: time));
                        },
                        child: Container(
                            height: mediaqueryHeight(0.04, context),
                            width: mediaqueryWidth(0.14, context),
                            decoration: BoxDecoration(
                              color: contianerColor(time, context),
                              border:
                                  Border.all(color: borderColor(time, context)),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: myFont(time,
                                  fontFamily: cabinCondensed,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  fontColor: textColor(time, context)),
                            )),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
