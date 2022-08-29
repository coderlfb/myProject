import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/utils/utils.dart';

import 'leading_back_widget.dart';

/// 导航栏组件
class AppBarView extends StatelessWidget with PreferredSizeWidget {
  AppBarView({Key? key, this.title, this.actions = const []}) : super(key: key);
  final String? title;
  List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const LeadingBackWidget(),
      title: Text(
        title!,
        style: TextStyle(
            fontSize: 16.w,
            color: HexColor('#626262'),
            fontWeight: FontWeight.w400,
            letterSpacing: 2.w),
      ),
      actions: actions,
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
