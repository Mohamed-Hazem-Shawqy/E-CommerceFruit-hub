import 'package:fruits_hub_app/core/services/data_base_service.dart';
import 'package:fruits_hub_app/core/services/auth_service.dart';
import 'package:fruits_hub_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub_app/features/auth/domain/repos/auth_repo_decl.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setUpGetit() {
  getit.registerLazySingleton<FirebaseAuthService>((() => AuthService()));
  getit.registerLazySingleton<DataBaseService>((() => FireStoreService()));
  getit.registerLazySingleton<AuthRepoDecl>(
    (() => AuthRepoImpl(
      firebaseAuthService: getit<FirebaseAuthService>(),
      dataBaseService: getit<DataBaseService>(),
    )),
  );
}
