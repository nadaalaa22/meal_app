class Categories {
  final String  name;
  final int color ,id;

  Categories(this.id, this.name, this.color);
  Map toMap() => {'name': name, 'color': color, 'id': id};

  factory Categories.fromMap(Map map) =>
      Categories( map['name'], map['color'], map['id']);
}