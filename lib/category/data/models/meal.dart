class Meal {
  final String imageUrl ,name ,time,state , id ;


  bool isFavorite ;

  Meal({required this.imageUrl, required this.name, required this.time, required this.state, required this.id, this.isFavorite = false});

  Map toMap() => {'name': name, 'id': id, 'time': time , 'imageUrl':imageUrl,'state':state,'isFavorite': isFavorite};

  factory Meal.fromMap(Map map) =>
      Meal(name: map['name'],id: map['id'], time: map['time'],imageUrl: map['imageUrl'],state :map['state'],isFavorite: map['isFavorite']);

}