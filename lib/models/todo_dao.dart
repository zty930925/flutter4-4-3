//檔案功用：確認任務狀態完成與否

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Todo {
  //建立一個變數，用來確認任務是否完成
  bool isComplete;
  //任務內容文字
  String content;
  //建構子
  Todo(this.isComplete, this.content);
}
