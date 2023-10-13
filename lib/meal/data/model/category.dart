class CategoryDataa {
  final String  name , color , id ;


  CategoryDataa( this.name, this.color,this.id,);
  Map toMap() => {'name': name, 'color': color, 'id': id};

  factory CategoryDataa.fromMap(Map map) =>
      CategoryDataa( map['name'], map['color'], map['id']);
}