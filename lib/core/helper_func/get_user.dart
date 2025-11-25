import 'dart:convert';

import 'package:fruits_hub_app/core/services/shared_pref_singleton.dart';
import 'package:fruits_hub_app/core/utils/end_points.dart';
import 'package:fruits_hub_app/features/auth/data/models/user_model.dart';
import 'package:fruits_hub_app/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = SharedPrefSingleton.getString(EndPoints.userData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
