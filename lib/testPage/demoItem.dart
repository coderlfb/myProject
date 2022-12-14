import 'package:flutter/material.dart';
import 'package:my_app/testPage/examplePage.dart';
// import 'package:my_app/testPage/jumpPage.dart';

class DemoItem extends StatefulWidget {
  const DemoItem({Key? key}) : super(key: key);

  @override
  State<DemoItem> createState() => _DemoItemState();
}

class _DemoItemState extends State<DemoItem> {
  ///返回一个居中带图标和文本的Item
  _getBottomItem(IconData icon, String text) {
    ///充满 Row 横向的布局
    return Expanded(
      flex: 1,

      ///居中显示
      child: Center(
        ///横向布局
        child: Row(
          ///主轴居中,即是横向居中
          mainAxisAlignment: MainAxisAlignment.center,

          ///大小按照最大充满
          mainAxisSize: MainAxisSize.max,

          ///竖向也居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ///一个图标，大小16.0，灰色
            Icon(
              icon,
              size: 16.0,
              color: Colors.red,
            ),

            // 距离图标的间隔
            const Padding(padding: EdgeInsets.only(left: 5.0)),

            ///显示文本
            Text(
              text,
              //设置字体样式：颜色灰色，字体大小14.0
              style: const TextStyle(color: Colors.grey, fontSize: 14.0),
              //超过的省略为...显示
              overflow: TextOverflow.ellipsis,
              //最长一行
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  _clickCard() {
    print("我要点击跳转");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => examplePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      ///卡片包装
      child: Card(

          ///增加点击效果
          child: FlatButton(
              onPressed: () {
                _clickCard();
                print("我使用点击了哦");
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ///文本描述
                    Container(
                        child: const Text(
                          "这是一行数据",
                          style: TextStyle(
                            color: Color(0xFFFF9000),
                            fontSize: 14.0,
                          ),

                          ///最长三行，超过... 显示
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        margin: const EdgeInsets.only(top: 6.0, bottom: 2.0),
                        alignment: Alignment.topLeft),
                    const Padding(padding: EdgeInsets.all(10.0)),

                    ///三个平均分配的横向图标文字
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _getBottomItem(Icons.star, "1000"),
                        _getBottomItem(Icons.link, "1000"),
                        _getBottomItem(Icons.subject, "1000"),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}
