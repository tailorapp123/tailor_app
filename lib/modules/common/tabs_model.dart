// To parse this JSON data, do
//
//     final tabListModel = tabListModelFromJson(jsonString);

import 'dart:convert';

TabListModel tabListModelFromJson(String str) =>
    TabListModel.fromJson(json.decode(str));

String tabListModelToJson(TabListModel data) => json.encode(data.toJson());

class TabListModel {
  TabListModel(
      {
        this.title,
        this.isSelected,
        this.count ,
        this.id,
        this.newCount = 0,
        this.preparingCount = 0,
        this.readyCount = 0,
        this.pastCount = 0 });

  String? title;
  String? id;
  int? count;
  int? newCount;
  int preparingCount;
  int readyCount;
  int pastCount;
  bool? isSelected;

  factory TabListModel.fromJson(Map<String, dynamic> json) => TabListModel(
    title: json["title"],
    id: json["id"],
    count: json["count"],
    isSelected: json["isSelected"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "id": id,
    "count": count,
    "isSelected": isSelected,
  };
}
