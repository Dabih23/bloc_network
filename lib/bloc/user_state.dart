abstract class UserState{}

class UserEmptyState extends UserState{//класс где нет данных (список пуст)

}

class UserLoadingState extends UserState{//класс где данные в состоянии загрузки

}

class UserLoadedState extends UserState{//класс где данные загружены
  List<dynamic> loadedUser;                     //обязательное условие
  UserLoadedState({required this.loadedUser}) : assert(loadedUser != null);
}

class UserErrorState extends UserState{//класс с ошибками (ошибка при загрузке данных)

}