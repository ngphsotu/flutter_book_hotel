import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home.dart';
import '/common/common.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.bg,
          appBar: appbarHome(context, navigator),
          body: bodyHome(context),
        );
      },
    );
  }

  // SingleChildScrollView bodyHome(BuildContext context) {
  //   return SingleChildScrollView(
  //         child: Form(
  //           key: _formKey,
  //           child: Column(
  //             children: [
  //               search(),
  //               Container(
  //                 width: double.infinity,
  //                 height: 385.h,
  //                 margin:
  //                     EdgeInsets.only(top: 135.h, left: 20.w, right: 20.w),
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(10.h),
  //                 ),
  //                 child: Container(
  //                   margin: EdgeInsets.only(
  //                       top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
  //                   child: Column(
  //                     children: [
  //                       ReuseTextFormField(
  //                         filled: true,
  //                         hintText: 'Where is Your Location ?',
  //                         prefixIcon: Icon(Icons.location_pin, size: 30.sp),
  //                         suffixIcon:
  //                             Icon(Icons.arrow_drop_down, size: 30.sp),
  //                       ),
  //                       SizedBox(height: 10.h),
  //                       // ReuseTextFormField(
  //                       //   filled: true,
  //                       //   hintText: 'How many rooms ?',
  //                       //   prefixIcon: Icon(Icons.home_work, size: 30.sp),
  //                       //   suffixIcon:
  //                       //       Icon(Icons.arrow_drop_down, size: 30.sp),
  //                       // ),
  //                       ReuseTextFieldChoose(
  //                         iconData: Icons.home_work,
  //                         hintText: 'How many rooms ?',
  //                         callBack: (val) {
  //                           numberRoom = int.parse(val);
  //                         },
  //                         items: listItemModel,
  //                       ),
  //                       SizedBox(height: 10.h),
  //                       // const ReuseDropdownButton(),
  //                       ReuseTextFieldChoose(
  //                         iconData: Icons.people,
  //                         hintText: 'How many adults ?',
  //                         callBack: (val) {
  //                           adults = int.parse(val);
  //                         },
  //                         items: listItemModel,
  //                       ),
  //                       SizedBox(height: 10.h),
  //                       // ReuseTextFormField(
  //                       //   filled: true,
  //                       //   hintText: 'How many child?',
  //                       //   prefixIcon: Icon(Icons.child_care, size: 30.sp),
  //                       //   suffixIcon:
  //                       //       Icon(Icons.arrow_drop_down, size: 30.sp),
  //                       // ),
  //                       ReuseTextFieldChoose(
  //                         iconData: Icons.child_care,
  //                         hintText: 'How many child ?',
  //                         callBack: (val) {
  //                           child = int.parse(val);
  //                         },
  //                         items: listItemModel,
  //                       ),
  //                       SizedBox(height: 10.h),
  //                       ReuseTextFormField(
  //                         filled: true,
  //                         hintText: 'Check In',
  //                         controller: controllerTimeCheckIn,
  //                         prefixIcon: Icon(Icons.calendar_today, size: 30.sp),
  //                         suffixIcon:
  //                             Icon(Icons.arrow_drop_down, size: 30.sp),
  //                         onTap: () async {
  //                           DateTime? dateCheckIn = await showDatePicker(
  //                             context: context,
  //                             initialDate: DateTime.now(),
  //                             firstDate: DateTime(2000),
  //                             lastDate: DateTime(2101),
  //                           );
  //                           if (dateCheckIn != null) {
  //                             String formatDate = DateFormat('dd/MM/yyyy')
  //                                 .format(dateCheckIn);
  //                             if (kDebugMode) {
  //                               print(formatDate);
  //                             }
  //                             setState(() {
  //                               controllerTimeCheckIn.text = formatDate;
  //                             });
  //                           } else {
  //                             if (kDebugMode) {
  //                               print("Date is not selected");
  //                             }
  //                           }
  //                         },
  //                       ),
  //                       SizedBox(height: 10.h),
  //                       ReuseTextFormField(
  //                         filled: true,
  //                         hintText: 'Check Out',
  //                         controller: controllerTimeCheckOut,
  //                         prefixIcon: Icon(Icons.calendar_today, size: 30.sp),
  //                         suffixIcon:
  //                             Icon(Icons.arrow_drop_down, size: 30.sp),
  //                         onTap: () async {
  //                           DateTime? dateCheckOut = await showDatePicker(
  //                             context: context,
  //                             initialDate: DateTime.now(),
  //                             firstDate: DateTime(2000),
  //                             lastDate: DateTime(2101),
  //                           );
  //                           if (dateCheckOut != null) {
  //                             String formatDate = DateFormat('dd/MM/yyyy')
  //                                 .format(dateCheckOut);
  //                             if (kDebugMode) {
  //                               print(formatDate);
  //                             }
  //                             setState(() {
  //                               controllerTimeCheckOut.text = formatDate;
  //                             });
  //                           } else {
  //                             if (kDebugMode) {
  //                               print("Date is not selected");
  //                             }
  //                           }
  //                         },
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               searchButton(),
  //             ],
  //           ),
  //         ),
  //       );
  // }
}
