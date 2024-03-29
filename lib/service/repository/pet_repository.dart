import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;

import '../../data/model/models.dart';
import '../../helper/helpers.dart';
import '../api/api_imports.dart';

abstract class PetRepository {
  Future<Either<Failure, GeneralBean>> addPet(
    FormData formFields,
  );

  Future<Either<Failure, GeneralBean>> editPet(
    int petId,
    FormData formFields,
  );

  Future<Either<Failure, PetListResponseBean>> getPetList(
    Map<String, dynamic> requestField,
  );

  Future<Either<Failure, PetDetailResponseBean>> getPetDetails(
    int petId,
  );

  Future<Either<Failure, GeneralBean>> removePet(
    int petId,
  );
}

class PetRepositoryImpl extends PetRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;
  final AppPreferences preferences;

  PetRepositoryImpl({
    required this.networkInfo,
    required this.apiService,
    required this.preferences,
  });

  @override
  Future<Either<Failure, GeneralBean>> addPet(
    FormData formFields,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(Endpoints.addPetPost,
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

  @override
  Future<Either<Failure, PetListResponseBean>> getPetList(
      Map<String, dynamic> requestField) async {
    if (await networkInfo.isConnected) {
      try {
        late PetListResponseBean bean;
        var result = await apiService.get(
          Endpoints.petListGet,
          queryParameters: requestField,
        );
        if (result.statusCode == 200) {
          var response = result.data;
          bean = PetListResponseBean.fromJson(response);
          if (bean.success == true) {
            return Right(bean);
          } else {
            return Left(Failure(422, bean.message ?? 'something_wrong'.tr));
          }
        }
        return Left(Failure(422, 'something_wrong'.tr));
      } catch (e) {
        return Left(ApiException.handle(e).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, GeneralBean>> removePet(int petId) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.delete(
          "${Endpoints.removePetDelete}$petId",
        );
        if (result.statusCode == 200) {
          var response = result.data;
          bean = GeneralBean.fromJson(response);
          if (bean.success == true) {
            return Right(bean);
          } else {
            return Left(Failure(422, bean.message ?? 'something_wrong'.tr));
          }
        }
        return Left(Failure(422, 'something_wrong'.tr));
      } catch (e) {
        return Left(ApiException.handle(e).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, PetDetailResponseBean>> getPetDetails(
      int petId) async {
    if (await networkInfo.isConnected) {
      try {
        late PetDetailResponseBean bean;
        var result = await apiService.get(
          "${Endpoints.petDetailGet}$petId",
        );
        if (result.statusCode == 200) {
          var response = result.data;
          bean = PetDetailResponseBean.fromJson(response);
          if (bean.success == true) {
            return Right(bean);
          } else {
            return Left(Failure(422, bean.message ?? 'something_wrong'.tr));
          }
        }
        return Left(Failure(422, 'something_wrong'.tr));
      } catch (e) {
        return Left(ApiException.handle(e).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, GeneralBean>> editPet(
      int petId, FormData formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post("${Endpoints.editPetPost}$petId",
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
