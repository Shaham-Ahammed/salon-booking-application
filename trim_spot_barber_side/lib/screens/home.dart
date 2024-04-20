import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/home_screen_pageview_bloc/home_screen_page_controller_bloc.dart';
import 'package:trim_spot_barber_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/home.dart';
import 'package:trim_spot_barber_side/utils/homepage/page_transition_home.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/app_bar.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/bookings_container.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/earnings_container.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/slots.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/smooth_page_indicator.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/todays_booking_heading.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    pageViewAutomaticTransition(context);
    return MultiBlocProvider(
      providers: [  
        BlocProvider<SlotSelectionBloc>(
            create: (context) => SlotSelectionBloc()),
      ],
      child: Scaffold(
        backgroundColor: blackColor,
        appBar: PreferredSize(
            preferredSize:
                Size(double.infinity, mediaqueryHeight(0.106, context)),
            child: AppBarHomeScreen()),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(mediaqueryWidth(0.04, context)),
          child: Column(
            children: [
              Container(
                height: mediaqueryHeight(0.2, context),
                child: PageView(
                  controller: homePageController,
                  onPageChanged: (int page) {
                    context
                        .read<HomeScreenPageControllerBloc>()
                        .add(PageChanged(newPage: page));
                  },
                  children: [
                    EarningsPageView(),
                    BookingsPageView(),
                  ],
                ),
              ),
              SizedBox(
                height: mediaqueryHeight(0.01, context),
              ),
              SmoothPageIndicatorHomeScreen(),
              SizedBox(
                height: mediaqueryHeight(0.01, context),
              ),
              TodaysBookingsHeading(),
              SlotTiles(),
              SizedBox(
                height: mediaqueryHeight(0.01, context),
              ),
              BlocBuilder<SlotSelectionBloc, SlotSelectionState>(
                builder: (context, state) {
                  return submitButtonCyan(context, text: "Lock Slots",
                      function: () {
                    return null;
                  },
                      heigh: mediaqueryHeight(0.05, context),
                      width: mediaqueryWidth(0.3, context),
                      fontSize: mediaqueryHeight(0.02, context),
                      buttonColor: buttonColor(context));
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}

Color buttonColor(context) {
  final selectedItems =
      BlocProvider.of<SlotSelectionBloc>(context).state.selectedSlots;
  if (selectedItems.isEmpty) {
    return greyColor;
  } else {
    return cyanColor;
  }
}
