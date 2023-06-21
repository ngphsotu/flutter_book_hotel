import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common.dart';
import '../utils/utils.dart';

class ReuseTextFieldChoose extends StatefulWidget {
  final String hintText;
  final String? intiText;
  final IconData iconData;
  final Function callBack;
  final List<ItemModel> items;

  const ReuseTextFieldChoose({
    super.key,
    this.intiText,
    required this.items,
    required this.iconData,
    required this.hintText,
    required this.callBack,
  });

  @override
  State<ReuseTextFieldChoose> createState() => _ReuseTextFieldChooseState();
}

class _ReuseTextFieldChooseState extends State<ReuseTextFieldChoose> {
  int _index = -1;
  // late final ThemeData themeData;
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.intiText);
    if (widget.intiText != null) {
      for (var element in widget.items) {
        if (element.name == widget.intiText) {
          _index = widget.items.indexOf(element);
        }
      }
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // themeData = Provider.of<ThemeChanger>(context).getTheme();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ReuseTextFormField(
          filled: true,
          hintText: widget.hintText,
          controller: controller,
          funcValidation: ValidateData.validEmpty,
          prefixIcon: Icon(widget.iconData, size: 30.sp),
          suffixIcon: Icon(Icons.arrow_drop_down, size: 30.sp),
        ),
        GestureDetector(
          onTap: () {
            showModalItem();
          },
          child: Container(
            color: AppColors.transparent,
            width: double.infinity,
            height: 50.h,
          ),
        )
      ],
    );
  }

  void showModalItem() => showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) => Center(
          child: Container(
            // margin: EdgeInsets.only(left: 170.w),
            width: 100.w,
            // height: 10.h * widget.items.length,
            height: 10.h,
            constraints: const BoxConstraints(minHeight: 200, maxHeight: 500),
            decoration: BoxDecoration(
              // color: themeData.scaffoldBackgroundColor,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
              child: widget.items.isNotEmpty
                  ? ListView.builder(
                      itemCount: widget.items.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: 15.h,
                            left: 10.w,
                            right: 10.w,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _index = i;
                              controller.text = widget.items[i].name;
                              widget.callBack(widget.items[i].name);
                              Navigator.pop(context);
                            },
                            child: Text(
                              widget.items[i].name,
                              style: TextStyle(
                                color: _index == i
                                    ? AppColors.primary
                                    // : themeData.textSelectionTheme.selectionColor,
                                    : Colors.black,
                                fontWeight: _index == i
                                    ? FontWeight.w800
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const NoFound(title: 'No data'),
            ),
          ),
        ),
      );
}
