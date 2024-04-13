import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/bottom_navigation_bloc/bottom_navigation_bar_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/email_bloc/profile_email_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_barber_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';
import 'package:trim_spot_barber_side/screens/bookings.dart';
import 'package:trim_spot_barber_side/screens/customer_support.dart';
import 'package:trim_spot_barber_side/screens/home.dart';
import 'package:trim_spot_barber_side/screens/profile.dart';
import 'package:trim_spot_barber_side/screens/reviews_and_ratings.dart';
import 'package:trim_spot_barber_side/screens/shop_mananagement.dart';
import 'package:trim_spot_barber_side/utils/bottom_navigation/page_index.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/bottom_navigation_list.dart';
import 'package:trim_spot_barber_side/utils/constant_variables/home.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/fade_transition.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/no_transition_page_route.dart';
import 'package:trim_spot_barber_side/utils/page_transitions/slide_transition.dart';
import 'package:trim_spot_barber_side/widgets/bottom_navigation/bottom_nav_bar.dart';
import 'package:trim_spot_barber_side/widgets/bottom_navigation/padding.dart';
import 'package:trim_spot_barber_side/widgets/profile_widgets/logout_alert.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: blackColor,
          width: mediaqueryWidth(0.85, context),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_rounded,
                        size: mediaqueryHeight(0.035, context),
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: mediaqueryHeight(0.05, context),
                            backgroundImage: AssetImage("assets/images/s2.jpg"),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Material(
                                borderRadius: BorderRadius.circular(90),
                                color: cyanColor,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.of(context).push(
                                        FadeTransitionPageRoute(
                                            child: ProfileScreen()));
                                  },
                                  borderRadius: BorderRadius.circular(90),
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        mediaqueryHeight(0.007, context)),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.edit,
                                      size: mediaqueryHeight(0.02, context),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        width: mediaqueryHeight(0.02, context),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myFont(
                              BlocProvider.of<ProfileNameBloc>(context)
                                  .state
                                  .name
                                  .toUpperCase(),
                              fontFamily: belleza,
                              fontSize: mediaqueryHeight(0.026, context),
                              fontWeight: FontWeight.w600,
                              fontColor: whiteColor),
                          myFont(
                              BlocProvider.of<ProfileEmailBloc>(context)
                                  .state
                                  .email
                                  .toLowerCase(),
                              fontFamily: balooChettan,
                              fontSize: mediaqueryHeight(0.016, context),
                              fontWeight: FontWeight.w400,
                              fontColor: greyColor),
                          myFont(
                              BlocProvider.of<ProfilePhoneBloc>(context)
                                  .state
                                  .phone,
                              fontFamily: balooChettan,
                              fontSize: mediaqueryHeight(0.016, context),
                              fontWeight: FontWeight.w400,
                              fontColor: greyColor),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.02, context),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: greyColor3,
                        borderRadius: BorderRadius.circular(90)),
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.01, context),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        drawerListTiles(context,
                            iconSize: mediaqueryHeight(0.03, context),
                            function: () {
                          Navigator.pop(context);
                          return null;
                        }, icon: Icons.home_outlined, title: "Home"),
                        drawerListTiles(context,
                            iconSize: mediaqueryHeight(0.029, context),
                            function: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                              FadeTransitionPageRoute(child: BookingsScreen()));
                          return null;
                        },
                            icon: Icons.calendar_today_outlined,
                            title: "Bookings"),
                        drawerListTiles(context,
                            iconSize: mediaqueryHeight(0.029, context),
                            function: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(FadeTransitionPageRoute(
                              child: ShopManagementScreen()));
                          return null;
                        },
                            icon: Icons.store_mall_directory_outlined,
                            title: "Shop Management"),
                        drawerListTiles(context,
                            iconSize: mediaqueryHeight(0.029, context),
                            function: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                              FadeTransitionPageRoute(child: ProfileScreen()));
                          return null;
                        }, icon: Icons.person_3_outlined, title: "Profile"),
                        drawerListTiles(context,
                            iconSize: mediaqueryHeight(0.029, context),
                            function: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(FadeTransitionPageRoute(
                              child: ReviewsAndRatingsScreen()));
                          return null;
                        },
                            icon: Icons.reviews_outlined,
                            title: "Reviews & Ratings"),
                        drawerListTiles(context,
                            iconSize: mediaqueryHeight(0.029, context),
                            function: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(FadeTransitionPageRoute(
                              child: CustomerSupport()));
                          return null;
                        },
                            icon: Icons.headset_mic_outlined,
                            title: "Customer Support"),
                        drawerListTiles(context,
                            iconSize: mediaqueryHeight(0.029, context),
                            function: () {
                          return null;
                        },
                            icon: Icons.list_alt_outlined,
                            title: "Terms & Conditions"),
                        drawerListTiles(context,
                            iconSize: mediaqueryHeight(0.029, context),
                            function: () {
                          return null;
                        },
                            icon: Icons.privacy_tip_outlined,
                            title: "Privacy Policy"),
                        drawerListTiles(context,
                            iconSize: mediaqueryHeight(0.029, context),
                            function: () {
                          return null;
                        },
                            color: Colors.yellow.shade600,
                            icon: Icons.star_rate_rounded,
                            title: "Rate Us"),
                        drawerListTiles(context,
                            iconSize: mediaqueryHeight(0.029, context),
                            function: () {
                          logoutConfirmation(context);
                          return null;
                        }, icon: Icons.logout_outlined, title: "Logout"),
                      ],
                      
                    ),
                  ),
                  
                  myFont("VERSION 1.0.0",
                      fontFamily: b612,
                      fontSize: mediaqueryHeight(0.015, context),
                      fontWeight: FontWeight.bold,
                      fontColor: greyColor3),
                ],
              ),
            ),
          ),
        ),
        key: homeScaffoldKey,
        backgroundColor: blackColor,
        body: tabs[pageIndex(context)],
        bottomNavigationBar: Padding(
          padding: bottomNavPadding(context),
          child: Container(
            height: mediaqueryHeight(0.08, context),
            child: BottomNavBar(),
          ),
        ));
  }

  ListTile drawerListTiles(BuildContext context,
      {required Function? function()?,
      required double iconSize,
      required String title,
      Color color = greyColor3,
      required IconData icon}) {
    return ListTile(
      onTap: function,
      leading: Icon(
        icon,
        color: color,
        size: iconSize,
      ),
      title: myFont(title,
          fontFamily: b612,
          fontSize: mediaqueryHeight(0.022, context),
          fontWeight: FontWeight.normal,
          fontColor: whiteColor),
    );
  }
}
