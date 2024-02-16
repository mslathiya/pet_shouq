// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;

import '../../data/model/models.dart';
import '../api/api_imports.dart';

abstract class VaccinationRepository {
  Future<Either<Failure, VaccinationListResponseBean>> getVaccinationList(
    int petId,
    Map<String, dynamic> requestField,
  );
  Future<Either<Failure, GeneralBean>> addVaccination(
    FormData formFields,
  );
  Future<Either<Failure, GeneralBean>> editVaccination(
    int petId,
    FormData formFields,
  );
  Future<Either<Failure, VaccinationDetailResponseBean>> getVaccinationDetail(
    int petId,
  );
  Future<Either<Failure, GeneralBean>> removeVaccination(
    int petId,
  );
}

class VaccinationRepositoryImpl extends VaccinationRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;

  VaccinationRepositoryImpl({
    required this.networkInfo,
    required this.apiService,
  });

  @override
  Future<Either<Failure, VaccinationListResponseBean>> getVaccinationList(
      int petId, Map<String, dynamic> requestField) async {
    if (await networkInfo.isConnected) {
      try {
        late VaccinationListResponseBean bean;
        var result = await apiService.get(
          "${Endpoints.vaccinationListGet}$petId",
          queryParameters: requestField,
        );
        if (result.statusCode == 200) {
          var response = result.data;

          bean = VaccinationListResponseBean.fromJson(response);
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
  Future<Either<Failure, GeneralBean>> addVaccination(
      FormData formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(Endpoints.addVaccinationPost,
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
  Future<Either<Failure, VaccinationDetailResponseBean>> getVaccinationDetail(
      int petId) async {
    if (await networkInfo.isConnected) {
      try {
        late VaccinationDetailResponseBean bean;
        var result = await apiService.get(
          "${Endpoints.vaccinationDetailGet}$petId",
        );
        if (result.statusCode == 200) {
          var response = result.data;

          bean = VaccinationDetailResponseBean.fromJson(response);
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
  Future<Either<Failure, GeneralBean>> removeVaccination(int petId) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.delete(
          "${Endpoints.removeVaccinationDelete}$petId",
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
  Future<Either<Failure, GeneralBean>> editVaccination(
      int petId, FormData formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(
            '${Endpoints.updateVaccinationPost}$petId',
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
