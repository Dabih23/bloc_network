import 'package:bloc_network/bloc/user_bloc.dart';
import 'package:bloc_network/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //BlocBuilder принимает Bloc(UserBloc) и State(UserState)
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState){ //если список пустой
        return Center(child: Text('Данные не загружены, нажмите <Load>'));
        }
        if (state is UserLoadingState){//если данные загружаются
        return Center(child: CircularProgressIndicator());
        }
        if (state is UserLoadedState){//если данные загружены
        return ListView.builder(
      itemCount: state.loadedUser.length,//список по длинне равен количеству загруженных пользователей
      itemBuilder: (contest, index) => Container(
        color: index % 2 == 0 ? Colors.white : Colors.grey,//если четный, то белый иначе серый цвет фона
        child: ListTile(
          leading: Text(
            'ID: ${state.loadedUser[index].id}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          title: Column(
            children: <Widget>[
              Text(
                '${state.loadedUser[index].name}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Email: ${state.loadedUser[index].email}',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Phone: ${state.loadedUser[index].phone}',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
    }
    if (state is UserErrorState){//если ошибка(пользователи не загрузились)
    return Center(child: Text('Ошибка при загрузке данных'));
    }
    return CircularProgressIndicator();
    },
    );
  }
}