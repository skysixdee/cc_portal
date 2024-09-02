// To parse this JSON data, do
//
//     final keyClockUserInfoModel = keyClockUserInfoModelFromJson(jsonString);

import 'dart:convert';

KeyClockUserInfoModel keyClockUserInfoModelFromJson(String str) =>
    KeyClockUserInfoModel.fromJson(json.decode(str));

String keyClockUserInfoModelToJson(KeyClockUserInfoModel data) =>
    json.encode(data.toJson());

class KeyClockUserInfoModel {
  int? exp;
  int? iat;
  int? authTime;
  String? jti;
  String? iss;
  String? aud;
  String? sub;
  String? typ;
  String? azp;
  String? nonce;
  String? sessionState;
  String? acr;
  RealmAccess? realmAccess;
  ResourceAccess? resourceAccess;
  String? scope;
  String? sid;
  bool? emailVerified;
  String? name;
  String? preferredUsername;
  String? givenName;
  String? familyName;
  String? email;

  KeyClockUserInfoModel({
    this.exp,
    this.iat,
    this.authTime,
    this.jti,
    this.iss,
    this.aud,
    this.sub,
    this.typ,
    this.azp,
    this.nonce,
    this.sessionState,
    this.acr,
    this.realmAccess,
    this.resourceAccess,
    this.scope,
    this.sid,
    this.emailVerified,
    this.name,
    this.preferredUsername,
    this.givenName,
    this.familyName,
    this.email,
  });

  factory KeyClockUserInfoModel.fromJson(Map<String, dynamic> json) =>
      KeyClockUserInfoModel(
        exp: json["exp"],
        iat: json["iat"],
        authTime: json["auth_time"],
        jti: json["jti"],
        iss: json["iss"],
        aud: json["aud"],
        sub: json["sub"],
        typ: json["typ"],
        azp: json["azp"],
        nonce: json["nonce"],
        sessionState: json["session_state"],
        acr: json["acr"],
        realmAccess: json["realm_access"] == null
            ? null
            : RealmAccess.fromJson(json["realm_access"]),
        resourceAccess: json["resource_access"] == null
            ? null
            : ResourceAccess.fromJson(json["resource_access"]),
        scope: json["scope"],
        sid: json["sid"],
        emailVerified: json["email_verified"],
        name: json["name"],
        preferredUsername: json["preferred_username"],
        givenName: json["given_name"],
        familyName: json["family_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "exp": exp,
        "iat": iat,
        "auth_time": authTime,
        "jti": jti,
        "iss": iss,
        "aud": aud,
        "sub": sub,
        "typ": typ,
        "azp": azp,
        "nonce": nonce,
        "session_state": sessionState,
        "acr": acr,
        "realm_access": realmAccess?.toJson(),
        "resource_access": resourceAccess?.toJson(),
        "scope": scope,
        "sid": sid,
        "email_verified": emailVerified,
        "name": name,
        "preferred_username": preferredUsername,
        "given_name": givenName,
        "family_name": familyName,
        "email": email,
      };
}

class RealmAccess {
  List<String>? roles;

  RealmAccess({
    this.roles,
  });

  factory RealmAccess.fromJson(Map<String, dynamic> json) => RealmAccess(
        roles: json["roles"] == null
            ? []
            : List<String>.from(json["roles"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
      };
}

class ResourceAccess {
  RealmAccess? account;
  RealmAccess? ccPortalService;

  ResourceAccess({
    this.account,
    this.ccPortalService,
  });

  factory ResourceAccess.fromJson(Map<String, dynamic> json) => ResourceAccess(
        account: json["account"] == null
            ? null
            : RealmAccess.fromJson(json["account"]),
        ccPortalService: json["CC-PORTAL-SERVICE"] == null
            ? null
            : RealmAccess.fromJson(json["CC-PORTAL-SERVICE"]),
      );

  Map<String, dynamic> toJson() => {
        "account": account?.toJson(),
        "CC-PORTAL-SERVICE": ccPortalService?.toJson(),
      };
}
