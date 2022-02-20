import 'package:bloc_network/bloc/user_event.dart';
import 'package:bloc_network/bloc/user_state.dart';
import 'package:bloc_network/models/user.dart';
import 'package:bloc_network/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState>{ //принимает репозиторий, в метод super передаем начальное значение
  final UsersRepository usersRepository;
  UserBloc(this.usersRepository): super(UserEmptyState()){
    //в методе on реализуем событие UserLoadEvent
    on<UserLoadEvent>((event, emit) async {
    emit(UserLoadingState());//берем состояние загрузки
    try{
    //переменная _loadUserList с типом List<User>, которая получает всех пользователей из репозитория  
    final List<User> _loadUserList = await usersRepository.getAllUsers();
    emit(UserLoadedState(loadedUser: _loadUserList));//в состояние передаем список пользователей(_loadUserList)
    } catch (_){
    emit(UserErrorState());//если ошибка, то метим ее
    }
    });
    on<UserClearEvent>((event, emit) async{
    emit(UserEmptyState());//при событии UserClearEvent возвращаем начальное состояние
    });
  }

}

