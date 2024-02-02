import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;

import '../../data/model/models.dart';
import '../api/api_imports.dart';
import "../../helper/helpers.dart";

abstract class AuthRepository {
  Future<Either<Failure, LoginBean>> loginMember(
    String email,
    String password,
    bool rememberLogin,
  );

  Future<Either<Failure, GeneralBean>> registerParent(
    FormData formFields,
  );

  Future<Either<Failure, GeneralBean>> forgotPassword(
    FormData formFields,
  );

  Future<Either<Failure, UserProfileBean>> getProfile();

  Future<Either<Failure, UserProfileBean>> updateParentProfile(
    FormData formFields,
  );

  Future<Either<Failure, ChangePasswordResponseBean>> changePassword(
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
    String email,
    String password,
    bool rememberLogin,
  ) async {
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
            var data = bean.data;
            if (data != null) {
              String appToken = data.token ?? "";
              await preferences.setUserToken(appToken);
              await preferences.setUserLogged();
              await preferences.setRememberLogin(rememberLogin);
              await preferences.setUserInfo(userBeanToJson(data));
              if (data.roleNames!.isNotEmpty) {
                String roleName = data.roleNames![0];
                await preferences.setUserType(roleName);
              }
            }
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
            AppLog.e("Fail ${bean.data}");
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
  Future<Either<Failure, UserProfileBean>> getProfile() async {
    if (await networkInfo.isConnected) {
      try {
        late UserProfileBean bean;
        var result = await apiService.get(
          Endpoints.profileGet,
        );
        if (result.statusCode == 200) {
          var response = result.data;
          bean = UserProfileBean.fromJson(response);
          if (bean.success == true) {
            var data = bean.data;
            if (data != null) {
              await preferences.setUserInfo(userBeanToJson(data));
            }
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
  Future<Either<Failure, UserProfileBean>> updateParentProfile(
      FormData formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late UserProfileBean bean;
        var result = await apiService.post(Endpoints.updateParentProfilePost,
            data: formFields,
            options: Options(headers: {"Content-Type": "multipart/form-data"}));
        if (result.statusCode == 200) {
          var response = result.data;
          bean = UserProfileBean.fromJson(response);
          if (bean.success == true) {
            var data = bean.data;
            if (data != null) {
              await preferences.setUserInfo(userBeanToJson(data));
            }
            return Right(bean);
          } else {
            return Left(Failure(200, bean.message ?? 'something_wrong'.tr));
          }
        }
        return Left(Failure(200, 'something_wrong'.tr));
      } catch (e) {
        e.printError();
        return Left(ApiException.handle(e).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, ChangePasswordResponseBean>> changePassword(
      FormData formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late ChangePasswordResponseBean bean;
        var result = await apiService.post(
          Endpoints.changePasswordPost,
          data: formFields,
        );
        if (result.statusCode == 200) {
          var response = result.data;
          bean = ChangePasswordResponseBean.fromJson(response);
          if (bean.success == true) {
            return Right(bean);
          } else {
            return Left(Failure(200, bean.message ?? 'something_wrong'.tr));
          }
        }
        return Left(Failure(200, 'something_wrong'.tr));
      } catch (e) {
        e.printError();
        return Left(ApiException.handle(e).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, GeneralBean>> forgotPassword(
      FormData formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(
          Endpoints.forgotPasswordPost,
          data: formFields,
        );
        if (result.statusCode == 200) {
          var response = result.data;
          bean = GeneralBean.fromJson(response);
          if (bean.success == true) {
            return Right(bean);
          } else {
            AppLog.e("Fail ${bean.data}");
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
