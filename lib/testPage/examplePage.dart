import 'package:flutter/material.dart';
import 'package:my_app/utils/utils.dart';
import 'package:my_app/testPage/index/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class examplePage extends StatefulWidget {
  const examplePage({Key? key}) : super(key: key);

  @override
  State<examplePage> createState() => _examplePageState();
}

// 底部按钮widget
class loginButtonWidget extends StatefulWidget {
  @override
  State<loginButtonWidget> createState() => _loginButtonWidgetState();
}

class _loginButtonWidgetState extends State<loginButtonWidget> {
  void _handleLogin() {
    print('点击登录按钮');

    // dynmic和Object区别
    // dynamic a = {};
    // Object b = "";
    // print(a.length);

    // final和const声明变量
    // final str = "hello flutter!"; // 第一次使用被初始化
    // const str2 = "hello world!"; // 编译时常量

    // 空安全(null-safty)
    // int num1 = 10;
    // int? num2;
    // late int num3; // 不确定初始值可稍后初始化
    // num3 = 35;
    // print(num3);

    // dynamic _nobleGases = {};
    // isNoble(int atomicNumber) {
    //   return _nobleGases[atomicNumber] != null;
    // }

    // bool isNoble(int atomicNumber) => true;

    // print(isNoble(2));

    // var say = (str) {
    //   print(str);
    // };
    // say("hi world");

    // // 函数作为参数传递
    // void execute(var callback) {
    //   callback();
    // }

    // execute(() => print("我是函数回调=========="));

    // 可选的位置参数
    // String meet(String from, String msg, [String? device]) {
    //   var result = '$from meet $msg';
    //   if (device != null) {
    //     result = '$result in $device';
    //   }
    //   return result;
    // }

    // print(meet("Bob", "Dandy"));
    // print(meet("Bob", "LiHua", "ShangHai"));

    // 可选的命名参数
    // 设置[bold]和[hidden]标志
    // void enableFlags({bool bold, String userName}) {
    //   // ...
    // }
    // enableFlags(bold: true, userName: 'x小明');

    // 异步支持
    // Future.delayed 创建了一个延时任务
    // Future.whenComplete 无论成功或失败都会进入
    // Future.delayed(Duration(seconds: 2), () {
    //   return "hi world!";
    //   // throw AssertionError("Error");
    // }).then((data) {
    //   print("异步请求成功==== $data");
    //   // print("异步请求成功啦~");
    // }, onError: (error) {
    //   print("我是then方法里面的捕获异常====");
    // }).catchError((e) {
    //   print("异步请求出错啦~");
    // }).whenComplete(() => print("成功或出错都进入了该方法======"));

    // var futureA = Future.delayed(Duration(seconds: 2), () {
    //   return "第一个请求等待2秒";
    // });
    // var futureB = Future.delayed(Duration(seconds: 4), () {
    //   return "第二个请求等待4秒";
    // });
    // Future.wait([futureA, futureB])
    //     .then((value) => print(value))
    //     .catchError((e) => {print(e)});

    // 页面条跳转
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const loginWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 470.w,
      height: 96.w,
      margin: EdgeInsets.only(top: ScreenUtil().setWidth(60)),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () => _handleLogin(),
        child: Container(
          width: ScreenUtil().setWidth(475),
          height: ScreenUtil().setWidth(104),
          alignment: Alignment.center,
          child: const Text(
            '跳转',
            style: TextStyle(
                fontSize: 28,
                height: 22 / 16,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: HexColor("#93BC53"),
          borderRadius: const BorderRadius.all(Radius.circular(156.0)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                offset: Offset(0, 8.0),
                blurRadius: 44.0)
          ]),
    );
  }
}

// 带“_”开头的成员或类是私有的 控制点击收藏状态的widget
class FavoriteWidget extends StatefulWidget {
  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        print("取消了收藏~");
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        print("增加了收藏");
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0.0),
          child: IconButton(
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[400],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}

class _examplePageState extends State<examplePage> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: const Text(
                  'first lake Campground',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'Second test',
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          )),
          FavoriteWidget()
        ],
      ),
    );
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE')
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: const Text(
        'this is my article,you are very stupid，hello hello hello hello hello',
        softWrap: true,
      ),
    );

    return Scaffold(
        // 背景样式
        backgroundColor: Colors.white,
        // 标题栏
        appBar: AppBar(
          // 这个title是一个widget
          title: const Text("示例flutter页面"),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/example.jpg',
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
            loginButtonWidget()
          ],
        ));
  }
}
