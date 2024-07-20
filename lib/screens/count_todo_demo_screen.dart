import 'package:flutter_application_6/components/common_drawer.dart';
import 'package:flutter_application_6/daos/todo_dao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountTodoDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CommonDrawer.getDrawer(context),
      body: Container(
        child: Text('目前的Todo數量為' +
            context.read<TodoDao>().getTodos().length.toString()),
      ),
    );
  }
}
