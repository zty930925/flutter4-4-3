import 'package:flutter_application_6/components/common_drawer.dart';
import 'package:flutter_application_6/components/todo_component.dart';
import 'package:flutter_application_6/daos/todo_dao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//為了讓畫面具有動態效果，繼承StatefulWidget
class TodoInputDemoScreen extends StatefulWidget {
  //為了有效保存用戶輸入的任務資料
  //建立一個List(接收資料的型態為字串)叫做todoList來存放用戶的輸入內容
  //存放用戶輸入的任務資料
  List<String> todoList = [];
  @override
  //Stateful的變化效果出自於createScreen函數
  State createState() {
    return _TodoInputDemoScreen();
  }
}

//設定_TodoInputDemoScreen寒士的內容
//每次渲染畫面時，執行的函式段落
class _TodoInputDemoScreen extends State<TodoInputDemoScreen> {
  @override
  Widget build(BuildContext context) {
    //使用TextField時，輸入完成後，先前的內容仍會留在畫面中
    //清空訊息框，需要TextEditingController當作TextField的參數
    var textEditController = TextEditingController();

    //文字輸入框
    Widget userInputTextField = Container(
      width: 500,
      child: TextField(
        //decoration:裝飾器
        //InputDecoration:文字框的外觀設計
        decoration:
            InputDecoration(border: OutlineInputBorder(), hintText: '輸入要執行的任務'),
        //用戶輸入的字，先經由controller後，才至其他功能
        controller: textEditController,
        //當用戶點擊時，將輸入的內容傳送出來，並渲染畫面
        onSubmitted: (inputValue) {
          setState(() {
            context.read<TodoDao>().inserTodo(inputValue);
            //清空輸入文字框
            textEditController.clear();
          });
        },
      ),
    );

    //回傳頁面
    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      body: Container(
        //要求在畫面的中上方
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            //輸入文字框
            userInputTextField,
            //三個點，使該list成為children的元素
            //透過管理種頁面的context，讀取provider提供的TodoDao
            //使getTodoDao可以調度所有todo，並將todo資料轉成TodoComponent
            ...context
                .watch<TodoDao>()
                .getTodos()
                .map((taskTodo) => Container(child: TodoComponent(taskTodo)))
                .toList()
          ],
        ),
      ),
    );
  }
}
