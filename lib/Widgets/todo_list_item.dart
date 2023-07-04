import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/Models/todo.dart';

class TodoListItem extends StatelessWidget {
  // O widget que criei na todoPage tem que ser chamado aqui
  const TodoListItem({
    Key? key,
    required this.todo,
    required this.onDelete,
  }) : super(key: key);

  final Todo todo;
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              // colocando borda
              borderRadius: BorderRadius.circular(4), // colocando borda
              color: Colors.grey[200],
            ),


            ///////////////////////////////////////////////////////////////////////////////////////
            ///////////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////////
            // CONFIGURANDO PARTE EXTERNA DA  LISTA









            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //colocando os textos no começo ocupando a maior largura sempre
              children: [
                Text(
                  DateFormat('dd/MM/yyyy- HH:mm').format(todo.dateTime),
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),




        ///////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////
        // CONFIGURANDO PARTE INTERNA DA LISTA




        actionExtentRatio: 0.2,
        // quanto meu icone vai usar de espaço
        actionPane: const SlidableStrechActionPane(),
        // Action pane é a animação que quero colocar na minha lista na hora de apagar
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            caption: 'Apagar', // texto em baixo do icone
            onTap: () {
              onDelete(todo);


              ///////////////////////////////////////////////////////////////////////////////////////
              ///////////////////////////////////////////////////////////////////////
              ////////////////////////////////////////////////////////////////////////////
              // CONFIGURANDO BOTÃO DA LISTA

            },
          ),
        ], // especificando as ações do botão
      ),
    ); // para poder aparecer o trem de apagar tarefa
  }
}
