class ToDo{
  String? id;
  String? toDoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.toDoText,
    this.isDone = false,
  });
  static List<ToDo> taskList(){
    return[
      ToDo(id: '1', toDoText: 'Example task', isDone: true),
      ToDo(id: '2', toDoText: 'new example', isDone: false),
      ToDo(id: '3',  toDoText: 'I think you know what to do with that', isDone: false),
      ToDo(id: '4', toDoText: 'go ahead, add some tasks', isDone: false),
  ];
}
}