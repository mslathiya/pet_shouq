// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;

import '../../data/model/models.dart';
import '../api/api_imports.dart';

abstract class NutritionRepository {
  Future<Either<Failure, NutritionListResponseBean>> getNutritionList(
    int petId,
    Map<String, dynamic> requestField,
  );
  Future<Either<Failure, GeneralBean>> addNutrition(
    FormData formFields,
  );
  Future<Either<Failure, GeneralBean>> editNutrition(
    int petId,
    FormData formFields,
  );
  Future<Either<Failure, NutritionDetailResponseBean>> getNutritionDetail(
    int petId,
  );
  Future<Either<Failure, GeneralBean>> removeNutrition(
    int petId,
  );
}

class NutritionRepositoryImpl extends NutritionRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;

  NutritionRepositoryImpl({
    required this.networkInfo,
    required this.apiService,
  });

  @override
  Future<Either<Failure, NutritionListResponseBean>> getNutritionList(
      int petId, Map<String, dynamic> requestField) async {
    if (await networkInfo.isConnected) {
      try {
        late NutritionListResponseBean bean;
        var result = await apiService.get(
          "${Endpoints.nutritionListGet}$petId",
          queryParameters: requestField,
        );
        if (result.statusCode == 200) {
          var response = result.data;

          bean = NutritionListResponseBean.fromJson(response);
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
  Future<Either<Failure, GeneralBean>> addNutrition(FormData formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(Endpoints.addNutritionPost,
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
  Future<Either<Failure, NutritionDetailResponseBean>> getNutritionDetail(
      int petId) async {
    if (await networkInfo.isConnected) {
      try {
        late NutritionDetailResponseBean bean;
        var result = await apiService.get(
          "${Endpoints.nutritionDetailGet}$petId",
        );
        if (result.statusCode == 200) {
          var response = result.data;

          bean = NutritionDetailResponseBean.fromJson(response);
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
  Future<Either<Failure, GeneralBean>> removeNutrition(int petId) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.delete(
          "${Endpoints.removeNutritionDelete}$petId",
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
  Future<Either<Failure, GeneralBean>> editNutrition(
      int petId, FormData formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(
            '${Endpoints.updateNutritionPost}$petId',
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
