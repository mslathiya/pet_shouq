import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' hide FormData;
import 'package:get/get.dart';

import '../../data/model/models.dart';
import '../../helper/app_preferences.dart';
import '../api/api_imports.dart';
import '../api/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginBean>> loginMember(
    String email,
    String password,
  );

  Future<Either<Failure, GeneralBean>> registerParent(
    FormData formFields,
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
            return Left(Failure(200, bean.message ?? 'something_wrong'.tr));
          }
        }
        return Left(Failure(200, 'something_wrong'.tr));
      } catch (e) {
        return Left(ApiException.handle(e).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, GeneralBean>> registerParent(
    FormData formFields,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(Endpoints.registerPetPost,
            data: formFields,
            options: Options(headers: {"Content-Type": "multipart/form-data"}));
        if (result.statusCode == 200) {
          var response = result.data;
          bean = GeneralBean.fromJson(response);
          if (bean.success == true) {
            return Right(bean);
          } else {
            return Left(Failure(200, bean.message ?? 'something_wrong'.tr));
          }
        }
        return Left(Failure(200, 'something_wrong'.tr));
      } catch (e) {
        return Left(ApiException.handle(e).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
