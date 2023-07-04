import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/pages/todo_list_page.dart';// estou importando meu projeto que esta em outra pasta
void main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,// tirando o banner feio
      home: TodoListPage() ,// home fala que é a tela inicial
    );//MaterialApp é o Widgetg principal
  }
}



