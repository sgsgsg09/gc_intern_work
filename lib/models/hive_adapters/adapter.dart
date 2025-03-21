import 'package:gc_intern_work/models/models.dart';
import 'package:hive/hive.dart';

/// Hospital 모델 어댑터
class HospitalAdapter extends TypeAdapter<Hospital> {
  @override
  final int typeId = 1;

  @override
  Hospital read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return Hospital(
      id: fields[0] as String,
      name: fields[1] as String,
      location: fields[2] as String,
      employees: (fields[3] as List).cast<Employee>(),
    );
  }

  @override
  void write(BinaryWriter writer, Hospital obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.employees);
  }
}

/// Employee 모델 어댑터
class EmployeeAdapter extends TypeAdapter<Employee> {
  @override
  final int typeId = 2;

  @override
  Employee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return Employee(
      id: fields[0] as String,
      jobTitle: fields[1] as String,
      workplace: fields[2] as String,
      memos: (fields[3] as List).cast<Comment>(),
    );
  }

  @override
  void write(BinaryWriter writer, Employee obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.jobTitle)
      ..writeByte(2)
      ..write(obj.workplace)
      ..writeByte(3)
      ..write(obj.memos);
  }
}

/// Comment 모델 어댑터
class CommentAdapter extends TypeAdapter<Comment> {
  @override
  final int typeId = 3;

  @override
  Comment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return Comment(
      id: fields[0] as String,
      content: fields[1] as String,
      editDate: fields[2] as DateTime,
      replies: (fields[3] as List).cast<Comment>(),
    );
  }

  @override
  void write(BinaryWriter writer, Comment obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.editDate)
      ..writeByte(3)
      ..write(obj.replies);
  }
}
