import 'dart:convert';
import 'package:bloc_network/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider{
  Future<List<User>> getUser() async {// получаем список польлзователей (Future принимает List пользователей)
    final response = await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users'));//указываем ссылку в переменную

    if (response.statusCode == 200) { //statusCode == 200 - это стандартный код успешного запроса
      final List<dynamic> userJson = json.decode(response.body);//переменная в которой декодируется json 
      return userJson.map((json) => User.fromJson(json)).toList(); //отображаем нашего пользователя в списке (map)
    } else {//иначе выдаем ошибку
      throw Exception('Error fetching users');
    }
  }
}