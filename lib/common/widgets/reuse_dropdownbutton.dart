import 'package:flutter/material.dart';
import 'package:flutter_book_hotel/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Flutter code sample for [DropdownButton].

const List<String> list = <String>[
  '01',
  '02',
  '03',
  '04',
  '05',
  '06',
  '07',
  '08',
  '09',
  '10',
];

class ReuseDropdownButton extends StatefulWidget {
  const ReuseDropdownButton({super.key});

  @override
  State<ReuseDropdownButton> createState() => _ReuseDropdownButtonState();
}

class _ReuseDropdownButtonState extends State<ReuseDropdownButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 57.h,
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(10.h),
        border: Border.all(color: AppColors.grey),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 7.w, right: 7.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.people, size: 30.sp, color: AppColors.grey2),
                SizedBox(width: 7.5.w),
                ReuseText(
                  text: 'How many adults ?',
                  color: AppColors.grey,
                  fontSize: 15.sp,
                ),
              ],
            ),
            DropdownButton(
              value: dropdownValue,
              icon: Icon(
                Icons.arrow_drop_down,
                size: 30.sp,
                color: AppColors.grey2,
              ),
              elevation: 0,
              style: const TextStyle(color: AppColors.grey),
              underline: Container(height: 0),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
