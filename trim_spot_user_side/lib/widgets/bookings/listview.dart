import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/bookings/bookings_demo_list.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/bookings/booking_status.dart';
import 'package:trim_spot_user_side/widgets/bookings/service_image.dart';
import 'package:trim_spot_user_side/widgets/bookings/service_name.dart';
import 'package:trim_spot_user_side/widgets/bookings/shop_details.dart';
import 'package:trim_spot_user_side/widgets/bookings/time_and_date.dart';

ListView bookingsListViewDisplay() {
    return ListView.separated(
                    itemBuilder: (context, index) {
                      final myBookings = bookingsModelList[index];
                      return Material(
                        color: transparentColor,
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: greyColor)),
                            height: mediaqueryHeight(0.13, context),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(
                                      mediaqueryHeight(0.012, context)),
                                  child:
                                      BookingsImage(myBookings: myBookings),
                                ),
                                SizedBox(
                                  width: mediaqueryWidth(0.02, context),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    servcieNameBookings(myBookings, context),
                                    TimeAndDateBookings(
                                        myBookings: myBookings),
                                    ShopDetails(myBookings: myBookings),
                                    bookingStatus(myBookings, context),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: mediaqueryHeight(0.024, context),
                      );
                    },
                    itemCount: bookingsModelList.length);
  }