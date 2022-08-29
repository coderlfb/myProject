import 'package:flutter/material.dart';
import 'package:my_app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/testPage/index/homeIndex.dart';

// ignore: camel_case_types
class loginWidget extends StatefulWidget {
  const loginWidget({Key? key, this.initValue = 0}) : super(key: key);

  final int initValue;

  @override
  State<loginWidget> createState() => _loginWidgetState();
}

// ignore: camel_case_types
class _loginWidgetState extends State<loginWidget> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _verificationCodeController =
      TextEditingController();
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // 初始化状态
    _counter = widget.initValue;
    print("initState=========$_counter");
  }

  void _handleBindMobile() {
    print('hi hello');
    setState(() {
      ++_counter;
    });
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ParentWidget()));
  }

  @override
  void didUpdateWidget(covariant loginWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidiget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      // 背景样式
      backgroundColor: Colors.white,
      // 标题栏
      appBar: AppBar(
        // 这个title是一个widget
        title: const Text("登录"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 60.0, 0, 0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(48, 42, 0, 40),
              alignment: Alignment.centerLeft,
              child: Text(
                "手机号登录",
                style: TextStyle(
                    fontSize: 44.0,
                    color: HexColor("#000000"),
                    fontWeight: FontWeight.w600,
                    height: 32 / 22),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 74.0,
              margin: const EdgeInsets.only(left: 48.0, right: 48.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 94.0,
                    child: Text(
                      '手机号',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: HexColor("#000000"),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 156.0,
                    child: TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                          hintText: '请输入手机号',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: HexColor("#999999"))),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1, color: HexColor("#DDDDDD")))),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 74.0,
              margin: const EdgeInsets.only(left: 48.0, right: 48.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 94.0,
                    child: Text(
                      '验证码',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: HexColor("#000000"),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 206.0,
                    child: TextField(
                      controller: _verificationCodeController,
                      maxLength: 6,
                      style: TextStyle(
                          fontSize: 18,
                          color: HexColor('#000000'),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),

              // decoration: BoxDecoration(
              //     border: Border(
              //         bottom:
              //             BorderSide(width: 1, color: HexColor("#DDDDDD")))),
            ),
            Container(
              width: 670.w,
              height: 96.w,
              margin: EdgeInsets.only(top: ScreenUtil().setWidth(60)),
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () => _handleBindMobile(),
                  child: Container(
                    width: ScreenUtil().setWidth(675),
                    height: ScreenUtil().setWidth(104),
                    alignment: Alignment.center,
                    child: const Text(
                      "登录",
                      style: TextStyle(
                          fontSize: 28,
                          height: 22 / 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  )),
              decoration: BoxDecoration(
                  color: HexColor("#93BC53"),
                  borderRadius: BorderRadius.all(Radius.circular(156.w)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: const Color.fromRGBO(0, 0, 0, 0.08),
                        offset: Offset(0, 8.w),
                        blurRadius: 44.w)
                  ]),
            ),
            // Container(
            //   child: Text(
            //     '计数器=========$_counter',
            //     style: TextStyle(fontSize: 28, color: HexColor("#000000")),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
