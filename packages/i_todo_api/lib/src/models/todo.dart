import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final String description;
  final String dueDate;
  final bool isDone;
  final String createdDate;
  Todo({
    String? id,
    String? createdDate,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isDone = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4(),
        createdDate = createdDate ?? DateTime.now().toIso8601String();

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    String? dueDate,
    bool? isDone,
    String? createdDate,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'isDone': isDone,
      'createdDate': createdDate,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      dueDate: map['dueDate'] ?? '',
      isDone: map['isDone'] ?? false,
      createdDate: map['createdDate'] ?? '',
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, description: $description, dueDate: $dueDate, isDone: $isDone, createdDate: $createdDate)';
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      description,
      dueDate,
      isDone,
      createdDate,
    ];
  }
}
