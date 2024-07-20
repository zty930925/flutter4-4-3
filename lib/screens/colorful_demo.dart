import 'package:flutter/material.dart';
import 'package:flutter_application_6/components/common_drawer.dart';
/*
* 設計 StatefulWidget，設定新狀態與保存狀態
* 未來用戶操作頁面時，即可時更換該內容，對畫面重新渲染變化
*/

class ColorfulDemoScreen extends StatefulWidget {
  //用來判斷顏色是否為紅色
  bool currentColorIsRed = true;
  //傳回一個類別為State<ColorfulDemoScreen>的物件
  @override
  State createState() {
    return _ColorfulDemoScreenState();
  }
}

/*
* 建立State，供Stateful Widget開發setState時，重新進行build函數，進行畫面渲染
*/
class _ColorfulDemoScreenState extends State<ColorfulDemoScreen> {
  //與先前StatelessWidget的build函數相似
  //用來進行畫面的繪製
  @override
  Widget build(BuildContext context) {
    //點擊按鈕後的狀態屬性變化，
    //在用戶尚未點擊按鈕，就先行檢閱屬性一次
    print("進入build函數時：widget的currentColorIsRed");
    print(this.widget.currentColorIsRed);

    // 依照新屬性，重新建立一個標有顏色的容器
    // 當widget的currentColorIsRed 為 true 時，即印製紅色容器
    // 當widget的currentColorIsRed 為 false 時，即印製藍色容器
    Widget colorfulContainer;
    if (this.widget.currentColorIsRed == true) {
      colorfulContainer = Container(
        color: Colors.red,
        width: 300,
        height: 300,
      );
    } else {
      colorfulContainer = Container(
        color: Colors.blue,
        width: 300,
        height: 300,
      );
    }

    //設置一個 Column，在第一列建立一個文字按鈕
    //在第二列傳入一個可變化頁面的Widget
    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
                // 設置一個文字按鈕
                child: TextButton(
              child: Text("按我變顏色"),
              onPressed: () {
                // 觸發setState()
                //flutter會重新執行build函數，重新進行畫面渲染
                setState(() {
                  print("用戶點擊過程中：widget 的 currentColorIsRed 屬性");
                  print(this.widget.currentColorIsRed);

                  //變更原來Widget的屬性
                  this.widget.currentColorIsRed =
                      !this.widget.currentColorIsRed;
                  print("用戶點擊過程後：widget 的 currentColorIsRed 屬性");
                  print(this.widget.currentColorIsRed);
                });
              },
            )),
            // 將先前依照currentColorIsRed的Widget，經畫面渲染後，置於此處
            colorfulContainer,
          ],
        ),
      ),
    );
  }
}
