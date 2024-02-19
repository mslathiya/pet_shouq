// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;

import '../../data/model/models.dart';
import '../api/api_imports.dart';

abstract class MedicationRepository {
  Future<Either<Failure, MedicationListResponseBean>> getMedicationList(
    int petId,
    Map<String, dynamic> requestField,
  );
  Future<Either<Failure, MedicationTypeListResponseBean>>
      getMedicationTypeList();
  Future<Either<Failure, GeneralBean>> addMedication(
    FormData formFields,
  );
  Future<Either<Failure, GeneralBean>> updateMedication(
    int medicationId,
    FormData formFields,
  );
  Future<Either<Failure, MedicationDetailResponseBean>> getMedicationDetail(
    int medicationId,
  );
  Future<Either<Failure, GeneralBean>> removeMedication(
    int medicationId,
  );
}

class MedicationRepositoryImpl extends MedicationRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;

  MedicationRepositoryImpl({
    required this.networkInfo,
    required this.apiService,
  });

  @override
  Future<Either<Failure, MedicationListResponseBean>> getMedicationList(
      int petId, Map<String, dynamic> requestField) async {
    if (await networkInfo.isConnected) {
      try {
        late MedicationListResponseBean bean;
        var result = await apiService.get(
          "${Endpoints.medicationListGet}$petId",
          queryParameters: requestField,
        );
        if (result.statusCode == 200) {
          var response = result.data;

          bean = MedicationListResponseBean.fromJson(response);
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
  Future<Either<Failure, MedicationDetailResponseBean>> getMedicationDetail(
      int medicationId) async {
    if (await networkInfo.isConnected) {
      try {
        late MedicationDetailResponseBean bean;
        var result = await apiService.get(
          "${Endpoints.medicationDetailGet}$medicationId",
        );
        if (result.statusCode == 200) {
          var response = result.data;

          bean = MedicationDetailResponseBean.fromJson(response);
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
  Future<Either<Failure, GeneralBean>> removeMedication(
      int medicationId) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.delete(
          "${Endpoints.removeMedicationDelete}$medicationId",
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
  Future<Either<Failure, GeneralBean>> addMedication(
      FormData formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(
          Endpoints.addMedicationPost,
          data: formFields,
        );
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
  Future<Either<Failure, GeneralBean>> updateMedication(
      int medicationId, FormData formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(
          '${Endpoints.updateMedicationPost}$medicationId',
          data: formFields,
        );
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
  Future<Either<Failure, MedicationTypeListResponseBean>>
      getMedicationTypeList() async {
    if (await networkInfo.isConnected) {
      try {
        late MedicationTypeListResponseBean bean;
        var result = await apiService.get(Endpoints.medicationTypeListGet);
        if (result.statusCode == 200) {
          var response = result.data;

          bean = MedicationTypeListResponseBean.fromJson(response);
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
}
