class User{
  final int id;
  final String name;
  final String? email; //этих значений может и не быть
  final String? phone; //этих значений может и не быть

  User({ required this.id, required this.name, this.email, this.phone});

  factory User.fromJson(Map<String, dynamic> json){ //принимает json и преобразуем в переменные
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'] ?? '',//если не придет, то пусто
      phone: json['phone'] ?? '',//если не придет, то пусто
    );
  } 
}