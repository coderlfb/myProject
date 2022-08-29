// ignore: file_names
import 'package:flutter/material.dart';
import 'package:my_app/testPage/demoItem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    // ScreenUtil.init(context, designSize: const Size(750, 1334));
    return Container();
    // return ScreenUtilInit(
    //     designSize: Size(750, 1334),
    //     builder: () => Scaffold(
    //           // 背景样式
    //           backgroundColor: Colors.grey,
    //           // 标题栏
    //           appBar: AppBar(
    //             // 这个title是一个widget
    //             title: const Text("第一个Flutter页面"),
    //             backgroundColor: Colors.blue,
    //           ),
    //           //正式页面的开始
    //           body: ListView.builder(
    //             itemBuilder: (context, index) {
    //               return const DemoItem();
    //             },
    //             itemCount: 1,
    //           ),
    //         ));
    // 一个页面的开始
    // 如果是新页面会自带返回按钮
  }
}
