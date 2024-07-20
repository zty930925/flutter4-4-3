//檔案功用：資料暫存區

import 'package:flutter_application_6/models/todo_dao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//繼承privoder套件的ChangeNotifier，使TodoDao類別具有notifyListeners
//當其他類別有訂閱此類別，此類別數據一更新後，會一併通知全部有訂閱此類別的函數
class TodoDao extends ChangeNotifier {
  //總資料暫存區
  List<Todo> todoList = [];
  //取用目前所有Todo的資料
  List<Todo> getTodos() {
    //將資料回傳
    return todoList;
  }

  //新增Todo，並添加todoList，並通知全部有訂閱TodoDao的類別
  void inserTodo(String inputContent) {
    todoList.add(Todo(false, inputContent));
    notifyListeners();
  }

  //更新Todo
  //當用戶勾選確認完成時，更新Todo內容，並塞回todoList，並通知全部有訂閱TodoDao的類別
  void updateTodo(Todo todo) {
    todoList[todoList.indexOf(todo)] = todo;
    notifyListeners();
  }
}
