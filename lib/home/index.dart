import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/components/app_bar_view.dart';
import 'package:my_app/utils/utils.dart';

class HomeIndexPage extends StatefulWidget {
  const HomeIndexPage({Key? key}) : super(key: key);

  @override
  State<HomeIndexPage> createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: ((context, child) {
          return Scaffold(
            appBar: AppBarView(
              title: "首页",
            ),
            body: getBodyUI(),
            backgroundColor: HexColor("#FCFCFC"),
          );
        }));
  }

  getBodyUI() {
    return PageView(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            "第一个tab页",
            style: TextStyle(fontSize: 20.w, color: HexColor("#000000")),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "第二个tab页",
            style: TextStyle(fontSize: 20.w),
          ),
        )
      ],
    );
  }
}
