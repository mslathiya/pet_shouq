import 'package:dartz/dartz.dart';
import 'package:get/get.dart' hide FormData;
import 'package:pet_shouq/data/model/failure.dart';
import 'package:pet_shouq/service/api/api_imports.dart';

abstract class AvailabilityRepository {
  Future<Either<Failure, Map<String, dynamic>>> getAvailability();
  Future<Either<Failure, Map<String, dynamic>>> addAvailability();
  Future<Either<Failure, Map<String, dynamic>>> updateAvailability();
  Future<Either<Failure, Map<String, dynamic>>> deleteAvailability();
}

class AvailabilityRepositoryImpl extends AvailabilityRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;

  AvailabilityRepositoryImpl({
    required this.networkInfo,
    required this.apiService,
  });

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAvailability() async {
    if (await networkInfo.isConnected) {
      try {
        var result = await apiService.get(
          Endpoints.getAvailability,
        );
        if (result.statusCode == 200) {
          Map<String, dynamic> bean = result.data;

          if (bean['success'] == true) {
            return Right(bean);
          } else {
            return Left(Failure(422, bean['message'] ?? 'something_wrong'.tr));
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
  Future<Either<Failure, Map<String, dynamic>>> addAvailability(
      {Map<String, dynamic>? data}) async {
    if (await networkInfo.isConnected) {
      try {
        var result =
            await apiService.post(Endpoints.addAvailability, data: data);
        if (result.statusCode == 200) {
          Map<String, dynamic> bean = result.data;

          if (bean['success'] == true) {
            return Right(bean);
          } else {
            return Left(Failure(422, bean['message'] ?? 'something_wrong'.tr));
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
  Future<Either<Failure, Map<String, dynamic>>> updateAvailability(
      {Map<String, dynamic>? data}) async {
    if (await networkInfo.isConnected) {
      try {
        var result =
            await apiService.post(Endpoints.updateAvailability, data: data);
        if (result.statusCode == 200) {
          Map<String, dynamic> bean = result.data;

          if (bean['success'] == true) {
            return Right(bean);
          } else {
            return Left(Failure(422, bean['message'] ?? 'something_wrong'.tr));
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
  Future<Either<Failure, Map<String, dynamic>>> deleteAvailability(
      {String? availabilityId}) async {
    if (await networkInfo.isConnected) {
      try {
        var result = await apiService
            .delete('${Endpoints.deleteAvailability}$availabilityId');
        if (result.statusCode == 200) {
          Map<String, dynamic> bean = result.data;

          if (bean['success'] == true) {
            return Right(bean);
          } else {
            return Left(Failure(422, bean['message'] ?? 'something_wrong'.tr));
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
