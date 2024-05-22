import 'package:todo_app/models/tasks.dart';

class Todocontrolers {
  final List<Tasks> _list = [
    Tasks(title: 'Do all h/w', subtitle: '24 may,13:00', ischechked: false),
    Tasks(title: 'Buy a cryptocurrency', subtitle: '31 may'),
    Tasks(title: 'Read a book', subtitle: 'Today'),
    Tasks(title: 'buy a watch', subtitle: '1 june'),
    Tasks(title: 'go to gym', subtitle: '27 may'),
  ];

  List<Tasks> get list {
    return [..._list];
  }

  add(String task, String date) {
    _list.add(Tasks(title: task, subtitle: date));
  }

  remove(index) {
    _list.removeAt(index);
    
  }
}
