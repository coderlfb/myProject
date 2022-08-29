import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/utils/utils.dart';

// class homeIndexWidget extends StatefulWidget {
//   const homeIndexWidget({Key? key}) : super(key: key);

//   @override
//   State<homeIndexWidget> createState() => _homeIndexState();
// }

// class _homeIndexState extends State<homeIndexWidget> {
//   bool _active = false;
//   void _handleTap() {
//     setState(() {
//       _active = !_active;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       child: Container(
//         child: Center(
//           child: Text(
//             _active ? 'Active' : 'InActive',
//             style: TextStyle(fontSize: 32.0, color: Colors.white),
//           ),
//         ),
//         width: 200.0,
//         height: 200.0,
//         decoration: BoxDecoration(
//             color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
//       ),
//     );
//   }
// }

// ParentWidget 为 TapboxB 管理状态.
//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    print("父组件管理状态=====");
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

// class TapboxB extends StatelessWidget {
//   TapboxB({Key? key, this.active: false, required this.onChanged})
//       : super(key: key);

//   final bool active;
//   final ValueChanged<bool> onChanged;

//   void _handleTap() {
//     print("子组件传值======$active");
//     onChanged(!active);
//   }

//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       child: Container(
//         child: Center(
//           child: Text(
//             active ? 'Active' : 'Inactive',
//             style: TextStyle(fontSize: 32.0, color: Colors.white),
//           ),
//         ),
//         width: 200.0,
//         height: 200.0,
//         decoration: BoxDecoration(
//           color: active ? Colors.lightGreen[700] : Colors.grey[600],
//         ),
//       ),
//     );
//   }
// }

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  TapboxC({Key? key, this.active: false, required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;
  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;
  bool _checkboxSelected = true;
  bool _switchSelected = true;
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleTapDown(TapDownDetails details) {
    print("手势按下======$details");
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    print("手势抬起======$details");
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    print("取消点击=====");
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    print("用户点击======");
    widget.onChanged(!widget.active);
  }

  void _onPressButton() {}
  void _onPressedButton2() {}

  @override
  void initState() {
    //监听输入改变
    _unameController.addListener(() {
      print(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    // return GestureDetector(
    //   onTapDown: _handleTapDown, // 处理按下事件
    //   onTapUp: _handleTapUp, // 处理抬起事件
    //   onTap: _handleTap,
    //   onTapCancel: _handleTapCancel,
    //   child: Container(
    //     child: Center(
    //       child: Text(
    //         widget.active ? 'Active' : 'Inactive',
    //         style: TextStyle(fontSize: 32.0, color: Colors.white),
    //       ),
    //     ),
    //     width: 200.0,
    //     height: 200.0,
    //     decoration: BoxDecoration(
    //       color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
    //       border: _highlight
    //           ? Border.all(
    //               color: Colors.teal,
    //               width: 10.0,
    //             )
    //           : null,
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => _onPressButton(),
            child: Container(
              width: ScreenUtil().setWidth(400.0),
              height: ScreenUtil().setWidth(96.0),
              alignment: Alignment.center,
              child: const Text(
                "示例按钮",
                style: TextStyle(fontSize: 14.0, color: Colors.white),
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
            ),
          ),
          TextButton.icon(
            icon: const Icon(Icons.info),
            label: const Text("详情"),
            onPressed: () => _onPressedButton2(),
          ),
          Checkbox(
              value: _checkboxSelected,
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value!;
                });
              }),
          Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              }),
          TextField(
            controller: _unameController,
            decoration: const InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            controller: _passwordController,
            onChanged: (v) {
              print("======值变化$v");
            },
            maxLength: 6,
            decoration: const InputDecoration(
                counterText: "",
                hintText: '请输入验证码',
                prefixIcon: Icon(Icons.lock)),
          )
        ],
      ),
    );
  }
}
