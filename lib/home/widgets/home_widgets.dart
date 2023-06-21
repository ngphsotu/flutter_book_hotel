import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../home.dart';
import '/common/common.dart';

// * HOME WIDGETS

// * Build Appbar Widget in Home Page
AppBar appbarHome(context, navigator) {
  return AppBar(
    leading: user(navigator),
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.bg,
    actions: [logout(context, navigator), SizedBox(width: 10.w)],
  );
}

// * Build Logout Widget in Home Page
Widget logout(BuildContext context, NavigatorState navigator) {
  return GestureDetector(
    onTap: () {
      if (kDebugMode) {
        print('Tapped Logout');
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Confirm Logout'),
            content: const Text('Are you sure ?'),
            actions: [
              TextButton(
                onPressed: () {
                  navigator.pop();
                  if (kDebugMode) {
                    print('Pressed Cancel Logout Text Button');
                  }
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  HomeController(context: context).removeUserData(context);
                },
                child: const Text('Confirm'),
              ),
            ],
          );
        },
      );
    },
    child: Icon(Icons.logout, size: 40.sp, color: AppColors.primary),
  );
}

// * Build User Widget in Home Page
Widget user(NavigatorState navigator) {
  return GestureDetector(
    onTap: () {
      navigator.pushNamed(AppRoutes.PROFILE);
      if (kDebugMode) {
        print('Tap Profile User');
      }
    },
    child: Container(
      margin: EdgeInsets.only(left: 10.h),
      child: Icon(
        Icons.account_circle,
        size: 40.sp,
        color: AppColors.primary,
      ),
    ),
  );
}

// * Build Search Button Widget in Home Page
Widget searchButton() {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    child: ReuseButton(
      textColor: Colors.white,
      buttonName: 'Search for'.toUpperCase(),
      onPressed: () {
        if (kDebugMode) {
          print('Press Search For Button');
        }
      },
    ),
  );
}

// * Build Body Widget in Home Page

int child = 0;
int adults = 0;
int numberRoom = 0;
String location = '';
final _formKey = GlobalKey<FormState>();
final TextEditingController controllerTimeCheckIn = TextEditingController();
final TextEditingController controllerTimeCheckOut = TextEditingController();
late final int endDay;
late final int startDay;
// late final HomeBloc homeBloc;
// late final ThemeData themeData;
late final TextEditingController controllerCity;
late final TextEditingController controllerSearch;

List<ItemModel> listOnetoTen = <ItemModel>[
  ItemModel(id: '01', name: '01'),
  ItemModel(id: '02', name: '02'),
  ItemModel(id: '03', name: '03'),
  ItemModel(id: '04', name: '04'),
  ItemModel(id: '05', name: '05'),
  ItemModel(id: '06', name: '06'),
  ItemModel(id: '07', name: '07'),
  ItemModel(id: '08', name: '08'),
  ItemModel(id: '09', name: '09'),
  ItemModel(id: '10', name: '10'),
];

List<ItemModel> listLocation = <ItemModel>[
  ItemModel(id: '01', name: 'An Giang'),
  ItemModel(id: '02', name: 'Vũng Tàu'),
  ItemModel(id: '03', name: 'Bạc Liêu'),
  ItemModel(id: '04', name: 'Bắc Kạn'),
  ItemModel(id: '05', name: 'Bắc Giang'),
  ItemModel(id: '06', name: 'Bắc Ninh'),
  ItemModel(id: '07', name: 'Bến Tre'),
  ItemModel(id: '08', name: 'Bình Dương'),
  ItemModel(id: '09', name: 'Bình Định'),
  ItemModel(id: '10', name: 'Bình Phước'),
  ItemModel(id: '11', name: 'Bình Thuận'),
  ItemModel(id: '12', name: 'Cà Mau'),
  ItemModel(id: '13', name: 'Cao Bằng'),
  ItemModel(id: '14', name: 'Cần Thơ'),
  ItemModel(id: '15', name: 'Đà Nẵng'),
  ItemModel(id: '16', name: 'Đắk Lắk'),
  ItemModel(id: '17', name: 'Đắk Nông'),
  ItemModel(id: '18', name: 'Điện Biên'),
  ItemModel(id: '19', name: 'Đồng Nai'),
  ItemModel(id: '20', name: 'Đồng Tháp'),
  ItemModel(id: '21', name: 'Gia Lai'),
  ItemModel(id: '22', name: 'Hà Giang'),
  ItemModel(id: '23', name: 'Hà Nam'),
  ItemModel(id: '24', name: 'Hà Nội'),
  ItemModel(id: '25', name: 'Hà Tĩnh'),
  ItemModel(id: '26', name: 'Hải Dương'),
  ItemModel(id: '27', name: 'Hải Phòng'),
  ItemModel(id: '28', name: 'Hoà Bình'),
  ItemModel(id: '29', name: 'Hồ Chí Minh'),
  ItemModel(id: '30', name: 'Hậu Giang'),
  ItemModel(id: '31', name: 'Hưng Yên'),
  ItemModel(id: '32', name: 'Khánh Hoà'),
  ItemModel(id: '33', name: 'Kiên Giang'),
  ItemModel(id: '34', name: 'Kon Tum'),
  ItemModel(id: '35', name: 'Lai Châu'),
  ItemModel(id: '36', name: 'Lào Cai'),
  ItemModel(id: '37', name: 'Lạng Sơn'),
  ItemModel(id: '38', name: 'Lâm Đồng'),
  ItemModel(id: '39', name: 'Long An'),
  ItemModel(id: '40', name: 'Nam Định'),
  ItemModel(id: '41', name: 'Nghệ An'),
  ItemModel(id: '42', name: 'Ninh Bình'),
  ItemModel(id: '43', name: 'Ninh Thuận'),
  ItemModel(id: '44', name: 'Phú Thọ'),
  ItemModel(id: '45', name: 'Phú Yên'),
  ItemModel(id: '46', name: 'Quảng Bình'),
  ItemModel(id: '47', name: 'Quảng Nam'),
  ItemModel(id: '48', name: 'Quảng Ngãi'),
  ItemModel(id: '49', name: 'Quảng Ninh'),
  ItemModel(id: '50', name: 'Quảng Trị'),
  ItemModel(id: '51', name: 'Sóc Trăng'),
  ItemModel(id: '52', name: 'Sơn La'),
  ItemModel(id: '53', name: 'Tây Ninh'),
  ItemModel(id: '54', name: 'Thái Bình'),
  ItemModel(id: '55', name: 'Thái Nguyên'),
  ItemModel(id: '56', name: 'Thanh Hoá'),
  ItemModel(id: '57', name: 'Huế'),
  ItemModel(id: '58', name: 'Tiền Giang'),
  ItemModel(id: '59', name: 'Trà Vinh'),
  ItemModel(id: '60', name: 'Tuyên Quang'),
  ItemModel(id: '61', name: 'Vĩnh Long'),
  ItemModel(id: '62', name: 'Vĩnh Phúc'),
  ItemModel(id: '63', name: 'Yên Bái'),
];

Widget bodyHome(BuildContext context) {
  return SingleChildScrollView(
    child: Form(
      key: _formKey,
      child: Column(
        children: [
          search(),
          Container(
            width: double.infinity,
            height: 385.h,
            margin: EdgeInsets.only(top: 135.h, left: 20.w, right: 20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.h),
            ),
            child: Container(
              margin: EdgeInsets.only(
                  top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
              child: Column(
                children: [
                  // ReuseTextFormField(
                  //   filled: true,
                  //   hintText: 'Where is Your Location ?',
                  //   prefixIcon: Icon(Icons.location_pin, size: 30.sp),
                  //   suffixIcon: Icon(Icons.arrow_drop_down, size: 30.sp),
                  // ),
                  ReuseTextFieldChoose(
                    iconData: Icons.location_pin,
                    hintText: 'Where is Your Location ?',
                    callBack: (val) {
                      location;
                    },
                    items: listLocation,
                  ),
                  SizedBox(height: 10.h),
                  ReuseTextFieldChoose(
                    iconData: Icons.people,
                    hintText: 'How many adults ?',
                    callBack: (val) {
                      adults = int.parse(val);
                    },
                    items: listOnetoTen,
                  ),
                  SizedBox(height: 10.h),
                  // ReuseTextFormField(
                  //   filled: true,
                  //   hintText: 'How many child?',
                  //   prefixIcon: Icon(Icons.child_care, size: 30.sp),
                  //   suffixIcon:
                  //       Icon(Icons.arrow_drop_down, size: 30.sp),
                  // ),
                  ReuseTextFieldChoose(
                    iconData: Icons.child_care,
                    hintText: 'How many children ?',
                    callBack: (val) {
                      child = int.parse(val);
                    },
                    items: listOnetoTen,
                  ),
                  SizedBox(height: 10.h),
                  // ReuseTextFormField(
                  //   filled: true,
                  //   hintText: 'How many rooms ?',
                  //   prefixIcon: Icon(Icons.home_work, size: 30.sp),
                  //   suffixIcon:
                  //       Icon(Icons.arrow_drop_down, size: 30.sp),
                  // ),
                  ReuseTextFieldChoose(
                    iconData: Icons.home_work,
                    hintText: 'How many rooms ?',
                    callBack: (val) {
                      numberRoom = int.parse(val);
                    },
                    items: listOnetoTen,
                  ),
                  SizedBox(height: 10.h),
                  ReuseTextFormField(
                    filled: true,
                    hintText: 'Check In',
                    controller: controllerTimeCheckIn,
                    prefixIcon: Icon(Icons.calendar_today, size: 30.sp),
                    suffixIcon: Icon(Icons.arrow_drop_down, size: 30.sp),
                    onTap: () async {
                      DateTime? dateCheckIn = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (dateCheckIn != null) {
                        String formatDate =
                            DateFormat('dd/MM/yyyy').format(dateCheckIn);
                        if (kDebugMode) {
                          print(formatDate);
                        }
                        // setState(() {
                        //   controllerTimeCheckIn.text = formatDate;
                        // });
                      } else {
                        if (kDebugMode) {
                          print("Date is not selected");
                        }
                      }
                    },
                  ),
                  SizedBox(height: 10.h),
                  ReuseTextFormField(
                    filled: true,
                    hintText: 'Check Out',
                    controller: controllerTimeCheckOut,
                    prefixIcon: Icon(Icons.calendar_today, size: 30.sp),
                    suffixIcon: Icon(Icons.arrow_drop_down, size: 30.sp),
                    onTap: () async {
                      DateTime? dateCheckOut = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (dateCheckOut != null) {
                        String formatDate =
                            DateFormat('dd/MM/yyyy').format(dateCheckOut);
                        if (kDebugMode) {
                          print(formatDate);
                        }
                        // setState(() {
                        //   controllerTimeCheckOut.text = formatDate;
                        // });
                      } else {
                        if (kDebugMode) {
                          print("Date is not selected");
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          searchButton(),
        ],
      ),
    ),
  );
}

// * Build Search Widget in Home Page
Widget search() {
  return Container(
    margin: EdgeInsets.only(top: 10.h, left: 30.w, right: 30.w),
    child: ReuseTextFormField(
      filled: true,
      fillColor: Colors.white,
      hintText: 'Search something ?',
      labelText: 'Search',
      suffixIcon: Icon(Icons.search, size: 30.sp),
    ),
  );
}
