import 'package:flutter/material.dart';
import 'package:flutter_todo/helpers/todo_dismissable_handler.dart';
import 'package:flutter_todo/modals/todos.modal.dart';
import 'package:flutter_todo/providers/todos.provider.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/dismissibale_backgrounds.dart';
import 'package:provider/provider.dart';

Dismissible todoCard(BuildContext context,TodosModal todo) {
    final TodoProvider todoProvider = Provider.of<TodoProvider>(context);
    return Dismissible(
      direction: DismissDirection.horizontal,
      key: UniqueKey(),
      background: DismissibleBackgrounds().slideRightBackground(),
      secondaryBackground: DismissibleBackgrounds().slideLeftBackground(),
      confirmDismiss: (direction) =>
          dismissableTodohandler(context, direction, todo),
      child: Row(
        children: [
          Transform.scale(
            scale: SizeConfig.blockSizeHorizontal * 0.25,
            child: Checkbox(
                side: BorderSide(color: ColorsConstants.green, width: 1.5),
                value: todo.isComplete,
                onChanged: (bool? value) async {
                  await todoProvider.completeTodo(docId: todo.id, value: value);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0))),
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 3,
          ),
          Text(
            todo.title,
            style: TextStyle(
                color: ColorsConstants.blue,
                fontSize: FontsConstants.base,
                fontWeight: FontsConstants.medium),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 4,
          ),
        ],
      ),
    );
  }