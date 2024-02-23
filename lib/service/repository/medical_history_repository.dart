import 'package:dartz/dartz.dart';
import 'package:get/get.dart' hide FormData;

import '../../data/model/models.dart';
import '../api/api_imports.dart';

abstract class MedicalHistoryRepository {
  Future<Either<Failure, MedicalHistoryListResponseBean>> getMedicalHistory(
    int petId,
    Map<String, dynamic> requestField,
  );

  Future<Either<Failure, GeneralBean>> addMedicalHistory(
    Map<String, dynamic> formFields,
  );
  Future<Either<Failure, GeneralBean>> removeHistory(
    int historyId,
  );
  Future<Either<Failure, MedicalHistoryResponseBean>> getHistoryDetail(
    int historyId,
  );
}

class MedicalHistoryRepositoryImpl extends MedicalHistoryRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;

  MedicalHistoryRepositoryImpl({
    required this.networkInfo,
    required this.apiService,
  });

  @override
  Future<Either<Failure, GeneralBean>> addMedicalHistory(
      Map<String, dynamic> formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(
          Endpoints.addMedicalHistoryPost,
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
  Future<Either<Failure, MedicalHistoryListResponseBean>> getMedicalHistory(
      int petId, Map<String, dynamic> requestField) async {
    if (await networkInfo.isConnected) {
      try {
        late MedicalHistoryListResponseBean bean;
        var result = await apiService.get(
          "${Endpoints.medicalHistoryListGet}$petId",
          queryParameters: requestField,
        );
        if (result.statusCode == 200) {
          var response = result.data;

          bean = MedicalHistoryListResponseBean.fromJson(response);
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
  Future<Either<Failure, GeneralBean>> removeHistory(int dietId) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.delete(
          "${Endpoints.removeMedicalHistoryDelete}$dietId",
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
  Future<Either<Failure, MedicalHistoryResponseBean>> getHistoryDetail(
      int dietId) async {
    if (await networkInfo.isConnected) {
      try {
        late MedicalHistoryResponseBean bean;
        var result = await apiService.get(
          "${Endpoints.medicalHistoryDetailGet}$dietId",
        );
        if (result.statusCode == 200) {
          var response = result.data;

          bean = MedicalHistoryResponseBean.fromJson(response);
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
