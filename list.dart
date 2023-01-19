class GSL {
  String id;
  String listText;
  bool isDone;

  GSL({
    required this.id,
    required this.listText,
    this.isDone = false,
});

  static List<GSL> groceryList() {
    return [
      GSL(id: '01', listText: 'Eggs', isDone: false),
      GSL(id: '02', listText: 'Almond Milk', isDone: false),
      GSL(id: '03', listText: 'Butter', isDone: false),
      GSL(id: '04', listText: 'Sourdough bread', isDone: false),
      GSL(id: '05', listText: 'Orange juice', isDone: false),
    ];
  }
}