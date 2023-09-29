class Meal {
  final String imageUrl ,name ,time,state;
  final int id;
  bool isFavorite ;

  Meal({required this.imageUrl, required this.name, required this.time, required this.state, required this.id, this.isFavorite = false});

}