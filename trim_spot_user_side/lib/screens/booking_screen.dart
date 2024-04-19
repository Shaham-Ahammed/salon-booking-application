import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:trim_spot_user_side/blocs/bookmark_animation_bloc/book_mark_animation_bloc.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/bloc/date_selection_bloc.dart';
import 'package:trim_spot_user_side/screens/reviews_and_ratings.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/slide_transition.dart';
import 'package:trim_spot_user_side/utils/reviews_and_ratings/modal_list.dart';
import 'package:trim_spot_user_side/utils/service_booking/animation_controller.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/utils/service_booking/service_available_list.dart';

class ServiceBookingScreen extends StatefulWidget {
  ServiceBookingScreen({super.key});

  @override
  State<ServiceBookingScreen> createState() => _ServiceBookingScreenState();
}

class _ServiceBookingScreenState extends State<ServiceBookingScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    bookmarkAnimationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    bookmarkAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DateSelectionBloc(),
      child: Scaffold(
          backgroundColor: blackColor,
          body: SafeArea(
              child: Column(children: [
            Stack(
              children: [
                Container(
                  width: mediaqueryWidth(1, context),
                  height: mediaqueryHeight(0.3, context),
                ),
                Positioned(
                    child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25)),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    "assets/images/shop_image.jpg",
                    height: mediaqueryHeight(0.28, context),
                    width: double.infinity,
                  ),
                )),
                Positioned(
                    left: mediaqueryWidth(0.04, context),
                    top: mediaqueryHeight(0.02, context),
                    child: Container(
                      height: mediaqueryHeight(0.035, context),
                      width: mediaqueryHeight(0.035, context),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: greyColor3),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: mediaqueryHeight(0.024, context),
                      ),
                    )),
                Positioned(
                  right: mediaqueryWidth(0.08, context),
                  bottom: mediaqueryHeight(-0.01, context),
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<BookMarkAnimationBloc>()
                          .add(BookMarkPressed());
                    },
                    child: Transform.scale(
                      scaleY: mediaqueryHeight(0.0014, context),
                      child: LottieBuilder.asset(
                          controller: bookmarkAnimationController,
                          onLoaded: (composition) {
                        bookmarkAnimationController.duration =
                            composition.duration;
                      },
                          repeat: false,
                          "assets/animations/bookmark_lottie.json"),
                    ),
                  ),
                )
              ],
            ),
            myFont("HIPOCHI SALON",
                fontFamily: balooChettan,
                fontSize: mediaqueryHeight(0.028, context),
                fontWeight: FontWeight.w600,
                fontColor: greyColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: greyColor,
                  size: mediaqueryHeight(0.022, context),
                ),
                myFont(" Mattanjeri",
                    fontFamily: balooChettan,
                    fontSize: mediaqueryHeight(0.022, context),
                    fontWeight: FontWeight.w500,
                    fontColor: greyColor)
              ],
            ),
            SizedBox(
              height: mediaqueryHeight(0.02, context),
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        top: mediaqueryHeight(0.033, context),
                        child: Container(
                          height: mediaqueryHeight(0.539, context),
                          width: mediaqueryWidth(1, context),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(179, 60, 60, 60),
                              border: Border.all(color: cyanColor),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(35),
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: mediaqueryHeight(0.05, context),
                                left: mediaqueryWidth(0.03, context),
                                right: mediaqueryWidth(0.03, context),
                                bottom: mediaqueryHeight(0.01, context)),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  serviceBookingScreenHeadings(
                                      context, "WORKING HOURS"),
                                  Container(
                                    width: double.infinity,
                                    height: mediaqueryHeight(0.06, context),
                                    decoration: BoxDecoration(
                                        color: greyColor3,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: greyColor, width: .4)),
                                    padding:
                                        containerPaddingServiceBooking(context),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: myFont("09:00 AM - 08:00 PM",
                                          fontFamily: cabinCondensed,
                                          textalign: TextAlign.start,
                                          fontSize:
                                              mediaqueryHeight(0.02, context),
                                          fontWeight: FontWeight.normal,
                                          fontColor: whiteColor),
                                    ),
                                  ),
                                  SizedBox(
                                    height: mediaqueryHeight(0.02, context),
                                  ),
                                  serviceBookingScreenHeadings(
                                      context, "USER REVIEWS"),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: reviewList.length > 2
                                          ? 2
                                          : reviewList.length,
                                      itemBuilder: (context, index) {
                                        final reviewer = reviewList[index];
                                        return Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (index != 0)
                                                SizedBox(
                                                  height: mediaqueryHeight(
                                                      0.02, context),
                                                ),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        reviewer.imagepath),
                                                    radius: 23,
                                                  ),
                                                  SizedBox(
                                                    width: mediaqueryWidth(
                                                        0.04, context),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      myFont(reviewer.name,
                                                          fontFamily:
                                                              balooChettan,
                                                          fontSize:
                                                              mediaqueryHeight(
                                                                  0.023,
                                                                  context),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontColor:
                                                              whiteColor),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: List.generate(
                                                            5, (index) {
                                                          if (index <
                                                              reviewer.rating) {
                                                            return Icon(
                                                              Icons
                                                                  .star_rate_rounded,
                                                              color:
                                                                  Colors.yellow,
                                                              size:
                                                                  mediaqueryHeight(
                                                                      0.023,
                                                                      context),
                                                            );
                                                          } else {
                                                            return Icon(
                                                                Icons
                                                                    .star_rate_rounded,
                                                                color:
                                                                    Colors.grey,
                                                                size: mediaqueryHeight(
                                                                    0.023,
                                                                    context));
                                                          }
                                                        }),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: mediaqueryHeight(
                                                    0.02, context),
                                              ),
                                              myFont(reviewer.review,
                                                  fontFamily: balooChettan,
                                                  fontSize: mediaqueryHeight(
                                                      0.018, context),
                                                  fontWeight: FontWeight.normal,
                                                  fontColor: greyColor),
                                              SizedBox(
                                                height: mediaqueryHeight(
                                                    0.006, context),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                  if (reviewList.length > 2)
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            SlideTransitionPageRoute(
                                                child:
                                                    ReviewsAndRatingsScreen(),
                                                direction: AxisDirection.up));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height:
                                                mediaqueryHeight(0.04, context),
                                          ),
                                          myFont("view more",
                                              fontFamily: balooChettan,
                                              fontSize: mediaqueryHeight(
                                                  0.018, context),
                                              fontWeight: FontWeight.normal,
                                              fontColor: greyColor2),
                                          Icon(
                                            Icons.arrow_drop_down_outlined,
                                            color: greyColor2,
                                            size: mediaqueryHeight(
                                                0.023, context),
                                          )
                                        ],
                                      ),
                                    ),
                                  SizedBox(
                                    height: mediaqueryHeight(0.012, context),
                                  ),
                                  serviceBookingScreenHeadings(context, "DATE"),
                                  BlocBuilder<DateSelectionBloc,
                                      DateSelectionState>(
                                    builder: (context, state) {
                                      return Material(
                                        borderRadius: BorderRadius.circular(10),
                                        color: blackColor,
                                        child: InkWell(
                                          onTap: () {
                                            context
                                                .read<DateSelectionBloc>()
                                                .add(DatePickerPressed(
                                                    context: context));
                                          },
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            width: double.infinity,
                                            height:
                                                mediaqueryHeight(0.06, context),
                                            decoration:
                                                containerBoxDecoration(),
                                            padding:
                                                containerPaddingServiceBooking(
                                                    context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  state.date != null
                                                      ? state.formattedDate
                                                      : "Select Date",
                                                  style: TextStyle(
                                                    fontFamily: cabinCondensed,
                                                    fontSize: mediaqueryHeight(
                                                        0.023, context),
                                                    fontWeight: FontWeight.w500,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.calendar_today_outlined,
                                                  color: whiteColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: mediaqueryHeight(0.012, context),
                                  ),
                                  serviceBookingScreenHeadings(
                                      context, "SERVICES"),
                                  Container(
                                    width: double.infinity,
                                    padding: containerPaddingServiceBooking(context),
                                    decoration: BoxDecoration(
                                      color: blackColor,
                                      border: Border.all(
                                          width: .4, color: cyanColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListView.builder(
                                      itemBuilder: (context, index) 
                                       
                                     
                                      {
                                          final service=serviceAvailableList[index];
                                        return Row(children: [
                                       
                                        Column(children: [myFont(text, fontFamily: fontFamily, fontSize: fontSize, fontWeight: fontWeight, fontColor: fontColor)],)],)},
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: mediaqueryWidth(0.06, context),
                          ),
                          roundIconsBookingScreen(
                            context,
                            icon: Icons.call_outlined,
                            function: () {},
                          ),
                          roundIconsBookingScreen(
                            context,
                            icon: Icons.map_outlined,
                            function: () {},
                          ),
                          roundIconsBookingScreen(
                            context,
                            icon: Icons.message_outlined,
                            function: () {},
                          ),
                          roundIconsBookingScreen(
                            context,
                            icon: Icons.share_outlined,
                            function: () {},
                          ),
                          SizedBox(
                            width: mediaqueryWidth(0.06, context),
                          ),
                        ],
                      )),
                    ],
                  )),
            )
          ]))),
    );
  }

  EdgeInsets containerPaddingServiceBooking(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: mediaqueryWidth(0.03, context),
    );
  }

  BoxDecoration containerBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: cyanColor, width: .4));
  }

  serviceBookingScreenHeadings(BuildContext context, String heading) {
    return Column(
      children: [
        myFont(heading,
            fontFamily: belleza,
            fontSize: mediaqueryHeight(0.022, context),
            fontWeight: FontWeight.w500,
            fontColor: greyColor2),
        SizedBox(
          height: mediaqueryHeight(0.008, context),
        ),
      ],
    );
  }

  Material roundIconsBookingScreen(BuildContext context,
      {required IconData icon, required Function()? function}) {
    return Material(
      color: blackColor,
      borderRadius: BorderRadius.circular(90),
      child: InkWell(
        borderRadius: BorderRadius.circular(90),
        onTap: function,
        child: Container(
          padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
          child: Icon(
            icon,
            color: whiteColor,
            size: mediaqueryHeight(0.025, context),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: cyanColor, width: 2),
          ),
        ),
      ),
    );
  }

  // Function to show date picker
}
