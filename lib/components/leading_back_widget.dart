import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_app/utils/utils.dart';

/// 左上角返回组件
class LeadingBackWidget extends StatelessWidget {
  const LeadingBackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 20.w,
        onPressed: () {
          Get.back();
        },
        color: HexColor("#626262"),
        icon: const Icon(Icons.arrow_back_ios_new));
  }
}
