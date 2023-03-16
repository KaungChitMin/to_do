import 'package:json_annotation/json_annotation.dart';

part 'to_do_vo.g.dart';

@JsonSerializable()
class ToDoVO {
  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'notes')
  String? notes;

  @JsonKey(name: 'date')
  String ? date;

  @JsonKey(name: 'time')
  String ? time;

  ToDoVO(this.title, this.description, this.notes, this.date, this.time);

  factory ToDoVO.fromJson(Map<String, dynamic> json) => _$ToDoVOFromJson(json);

//Map<String,dynamic>toJson()=>_$ToDoVOToJson(this);

}
