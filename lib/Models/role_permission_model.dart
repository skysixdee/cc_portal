// To parse this JSON data, do
//
//     final rolePermissionModel = rolePermissionModelFromJson(jsonString);

import 'dart:convert';

RolePermissionModel rolePermissionModelFromJson(String str) =>
    RolePermissionModel.fromJson(json.decode(str));

String rolePermissionModelToJson(RolePermissionModel data) =>
    json.encode(data.toJson());

class RolePermissionModel {
  int? roleId;
  String? roleName;
  bool? allScreens;
  bool? allActions;
  List<Screen>? screens;
  List<Action>? actions;

  RolePermissionModel({
    this.roleId,
    this.roleName,
    this.allScreens,
    this.allActions,
    this.screens,
    this.actions,
  });

  factory RolePermissionModel.fromJson(Map<String, dynamic> json) =>
      RolePermissionModel(
        roleId: json["role_id"],
        roleName: json["role_name"],
        allScreens: json["all_screens"],
        allActions: json["all_actions"],
        screens: json["screens"] == null
            ? []
            : List<Screen>.from(
                json["screens"]!.map((x) => Screen.fromJson(x))),
        actions: json["actions"] == null
            ? []
            : List<Action>.from(
                json["actions"]!.map((x) => Action.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "role_id": roleId,
        "role_name": roleName,
        "all_screens": allScreens,
        "all_actions": allActions,
        "screens": screens == null
            ? []
            : List<dynamic>.from(screens!.map((x) => x.toJson())),
        "actions": actions == null
            ? []
            : List<dynamic>.from(actions!.map((x) => x.toJson())),
      };
}

class Action {
  int? actionId;
  String? actionName;

  Action({
    this.actionId,
    this.actionName,
  });

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        actionId: json["action_id"],
        actionName: json["action_name"],
      );

  Map<String, dynamic> toJson() => {
        "action_id": actionId,
        "action_name": actionName,
      };
}

class Screen {
  int? screenId;
  String? screenName;

  Screen({
    this.screenId,
    this.screenName,
  });

  factory Screen.fromJson(Map<String, dynamic> json) => Screen(
        screenId: json["screen_id"],
        screenName: json["screen_name"],
      );

  Map<String, dynamic> toJson() => {
        "screen_id": screenId,
        "screen_name": screenName,
      };
}
