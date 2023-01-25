import 'package:json_annotation/json_annotation.dart';

part 'item_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ItemListModel {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'subtitle')
  final String? subtitle;

  ItemListModel(this.id, this.title, this.subtitle);

  factory ItemListModel.fromJson(Map<String, dynamic> json) =>
      _$ItemListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemListModelToJson(this);
}
