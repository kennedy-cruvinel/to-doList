import 'package:flutter/material.dart';
import 'package:todo_list/Models/todo.dart';

import '../Widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
   TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
   final TextEditingController todoController=TextEditingController();
// criando um controlador para pegar o texto de um campo
   List<Todo> todos=[]; // criando uma lista  da Classe que fizemos
  Todo? deletedTodo;
  int? deletedTodoPos;
// todos é tarefas em inglês, objetivo de pegar o texto que tiver nos campos e jogar nessa lista
  @override
  Widget build(BuildContext context) {
    return SafeArea(// vai mantar os componentes dentro da área segura
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            // dando um afastastamento horizontal em tudo
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // Precisei criar uma coluna pelo fato que iria criar outra Row
              children: [
                Row(
                  children: [
                    Expanded(
                      // vai expandir o tamanho de texto ate a maior altura possivel
                      child: TextField(
                        controller: todoController ,// coloquei meu controlador aqui
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma Tarefa',
                          hintText: 'Ex: Estudar Flutter ',
                        ),
                      ),
                    ),



                    SizedBox(width: 8),
                    //Dando um espaço vazio entre o digitar e o botão





                    //////////////////////////////////////////////
                    ///////////////////////////////////////////////
                    //////////////////////////////////////
                    // BOTÃO DE ADD TAREFA
                    ElevatedButton(
                      onPressed: () {
                        String text= todoController.text;
                        setState(() {// quando vai adicionar um nova Tarefa apertando no botão, primeiro cria um objeto e o adiciona na lista
                          Todo newTodo= Todo(title: text, dateTime: DateTime.now(),);
                          todos.add(newTodo);// adicionando o que esta escrito no campo na lista todo

                        });
                        todoController.clear();

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: EdgeInsets.all(14),
                      ), // personalizar o botão
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),










             Flexible(// flexible é o que me deixa usar o scroll entre os itens
               child: ListView(// criando minha lista
                 shrinkWrap: true,// Esse comando diz que a lista vai ser do tamanho que os containers consomem
                 children: [
                   for(Todo todo in todos )// para cada tarefa na lista de tarefas, adicionar uma list
                     TodoListItem(
                       todo:todo,
                       onDelete:onDelete,

                     )//Criando um item personalizado meu para personalizar todos os dados da lista juntos.... dei altenter e importei o item


                 ],
               ),
             ),



























                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(// expandindo ate a maior largura possivel
                      child: Text(
                        'Você Possui ${todos.length} tarefas pendentes',// contador de tarefas
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: showDeleleteTodosConfirmationDialog,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: EdgeInsets.all(14),
                      ),
                      child: Text('Limpar tudo'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void onDelete(Todo todo) {
    deletedTodo=todo; // QUAL TAREFA SERA REMOVIDA
    deletedTodoPos=todos.indexOf(todo);// QUAL A POS DA TAREFA REMOVIDA
    setState(() {
      todos.remove(todo);
    });







ScaffoldMessenger.of(context).clearSnackBars();//PARA PODER APAGAR VARIAS TAREFAS E DEIXAR APENAS A ULTIMA APAGADA
    ScaffoldMessenger.of(context).showSnackBar(// REMOVENDO TAREFA
      SnackBar(content: Text('Tarefa ${todo.title} foi removida com sucesso!',
        style:TextStyle(color: Color(0xff060708))),
        backgroundColor: Colors.white,




        





        action: SnackBarAction(// ADICIONANDO O BOTÃO DESFAZER
          label: 'Desfazar',
          textColor: Colors.purple,
          onPressed: (){
            setState(() {
              todos.insert(deletedTodoPos!, deletedTodo!);
            });

          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }










  // BOTÃO DE APAGAR TUDO
   void showDeleleteTodosConfirmationDialog(){
    showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text('Limpar tudo ?'),
      content: Text('Você tem certeza que deseja apagar todas as tarefas? '),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop(); //FECHAR O DIALOGO
        },
          style: TextButton.styleFrom(primary: Colors.purple),
          child: Text('Cancelar'),),




        TextButton(onPressed: (){
          Navigator.of(context).pop(); //FECHAR O DIALOGO
deleteAllTodos();
        },
          style: TextButton.styleFrom(primary: Colors.red),

          child: Text(' Limpar tudo'),),

      ],
    ),
    );
  }
  void deleteAllTodos(){
    setState(() {
      todos.clear();
    });
  }
}
