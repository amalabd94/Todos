
import 'package:flutter/cupertino.dart';


class Todo {
  List<Todos>? todos;
  int? total;
  int? skip;
  int? limit;

  Todo({this.todos, this.total, this.skip, this.limit});

  Todo.fromJson(Map<String, dynamic> json) {
    if (json['todos'] != null) {
      todos = (json['todos'] as List).map((v) => Todos.fromJson(v)).toList();
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (todos != null) {
      data['todos'] = todos!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Todos {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todos({this.id, this.todo, this.completed, this.userId});

  Todos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['todo'] = todo;
    data['completed'] = completed;
    data['userId'] = userId;
    return data;
  }
}

