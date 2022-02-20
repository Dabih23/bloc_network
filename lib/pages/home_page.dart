import 'package:bloc_network/bloc/user_bloc.dart';
import 'package:bloc_network/services/user_repository.dart';
import 'package:bloc_network/widgets/action_buttons.dart';
import 'package:bloc_network/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget{
  final usersRepository = UsersRepository();//в переменную usersRepository передаем UsersRepository
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(//Blocrovider, который принимает UserBloc
      create: (context) => UserBloc(usersRepository),//у UserBloc вызываем репозиторий
      child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Users List'),
        centerTitle: true,
        backgroundColor: Colors.grey[600],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ActionButtons(),
          Expanded(child: UserList()),
        ],
      ),
    ),
  );    
  }
}