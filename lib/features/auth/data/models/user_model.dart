import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub_app/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? "",
      email: user.email ?? '',
      uId: user.uid,
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uid'],
    );
  }
  factory UserModel.fromUserEntity(UserEntity entity) {
    return UserModel(name: entity.name, email: entity.email, uId: entity.uId);
  }
  toJson() {
    return {'name': name, 'email': email, 'uid': uId};
  }
}
