import 'package:flutter/material.dart';
import 'dart:async';

class JumpPageWidget extends StatefulWidget {
  // const JumpPage({Key? key}) : super(key: key);

  final String text;
  JumpPageWidget(this.text);

  @override
  _JumpPageState createState() => _JumpPageState(text);
}

class _JumpPageState extends State<JumpPageWidget> {
  String text;
  _JumpPageState(this.text);

  @override
  void initState() {
    ///初始化，这个函数在生命周期中只调用一次
    super.initState();

    ///定时2秒
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        text = "我是传过去的数值";
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    ///在initState之后调 Called when a dependency of this [State] object changes.
    super.didChangeDependencies();
  }

  _goBack() {
    Navigator.pop(context);
  }

  getAppBarStyle() {
    return Container(
      // child: Text(
      //   text ?? "这就是有状态DMEO",
      //   style: const TextStyle(fontSize: 28.0, color: Colors.blueGrey),
      // ),
      child: TextButton(
          onPressed: () => _goBack(),
          child: Container(
            width: 675,
            height: 104,
            alignment: Alignment.center,
            child: const Text(
              "登录",
              style: TextStyle(
                  fontSize: 14.0,
                  height: 22 / 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 背景样式
      backgroundColor: Colors.white,
      // 标题栏
      appBar: AppBar(
        // 这个title是一个widget
        title: const Text("Flutter跳转"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
