import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:pet_shouq/data/model/failure.dart';
import 'package:pet_shouq/data/model/feeding_schedule_response_model.dart';
import 'package:pet_shouq/data/model/general_response_bean.dart';
import 'package:pet_shouq/service/api/api_imports.dart';

abstract class PetFeedingSchedulesRepository {
  Future<Either<Failure, FeedingScheduleResponseModel>> getFeedingSchedulesList(
      String petId);
}

class PetFeedingSchedulesRepositoryImpl extends PetFeedingSchedulesRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;

  PetFeedingSchedulesRepositoryImpl({
    required this.networkInfo,
    required this.apiService,
  });

  @override
  Future<Either<Failure, FeedingScheduleResponseModel>> getFeedingSchedulesList(
      String petId) async {
    if (await networkInfo.isConnected) {
      try {
        late FeedingScheduleResponseModel bean;
        var result = await apiService.get("${Endpoints.feedingScheduleGet}$petId");
        if (result.statusCode == 200) {
          var response = result.data;

          bean = FeedingScheduleResponseModel.fromJson(response);
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
  Future<Either<Failure, GeneralBean>> addFeedingSchedules(
      FormData formFields,
      ) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(Endpoints.addSchedulePost,
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
