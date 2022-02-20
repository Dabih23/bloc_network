import 'package:bloc_network/bloc/user_bloc.dart';
import 'package:bloc_network/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {     //тип UserBloc
    final UserBloc userBloc = context.read<UserBloc>();//реализуем наш Bloc
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          child: Text('Load'),
          onPressed: () {
          userBloc.add(UserLoadEvent());//при нажатии на Load вызываем метод UserLoadEvent
          },
          color: Colors.green,
        ),       
        SizedBox(width: 8.0),
        RaisedButton(
          child: Text('Clear'),
          onPressed: () {
          userBloc.add(UserClearEvent());//при нажатии на Clear вызываем метод UserClearEvent
          },
          color: Colors.red,
        ),
      ]
    );
  }  
}