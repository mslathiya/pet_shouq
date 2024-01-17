import 'package:dartz/dartz.dart';

import '../../data/model/models.dart';
import '../../helper/app_preferences.dart';
import '../api/api_imports.dart';
import '../api/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginBean>> loginMember(
    String email,
    String password,
  );
}

class AuthRepositoryImpl extends AuthRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;
  final AppPreferences preferences;

  AuthRepositoryImpl({
    required this.networkInfo,
    required this.apiService,
    required this.preferences,
  });

  @override
  Future<Either<Failure, LoginBean>> loginMember(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        late LoginBean bean;
        var result = await apiService.post(Endpoints.loginPost, data: {
          "user_email": email,
          "password": password,
        });
        if (result.statusCode == 200) {
          var response = result.data;
          bean = LoginBean.fromJson(response);
          if (bean.success == true) {
            String appToken = bean.data!.token ?? "";
            await preferences.setUserToken(appToken);
            await preferences.setUserLogged();
            await preferences.setUserInfo(loginBeanToJson(bean));
            return Right(bean);
          } else {
            return Left(Failure(200, bean.message ?? "Something goes wrong"));
          }
        }
        return Left(Failure(200, "Something goes wrong"));
      } catch (e) {
        return Left(ApiException.handle(e).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
