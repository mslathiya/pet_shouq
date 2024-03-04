// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;
import 'package:pet_shouq/data/model/vat_details_response_model.dart';
import 'package:pet_shouq/data/model/vet_list_response_model.dart';
import 'package:pet_shouq/data/model/vet_slot_data_response_mode;.dart';

import '../../data/model/models.dart';
import '../api/api_imports.dart';

abstract class VetDataRepository {
  Future<Either<Failure, VetListResponseModel>> getVetList(
    String latitude,
    String longitude,
  );

  Future<Either<Failure, VetDetailsResponseModel>> getVetDetails(
    String veterinarianId,
  );

  Future<Either<Failure, SlotListResponseModel>> getVetSlotList(
    String date,
    String vetId,
  );
}

class VetDataRepositoryImpl extends VetDataRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;

  VetDataRepositoryImpl({
    required this.networkInfo,
    required this.apiService,
  });

  @override
  Future<Either<Failure, VetListResponseModel>> getVetList(
      String latitude, String longitude) async {
    if (await networkInfo.isConnected) {
      try {
        late VetListResponseModel bean;
        var result = await apiService.get(
            "${Endpoints.vetDashboardListGet}latitude=$latitude&longitude=$longitude");
        if (result.statusCode == 200) {
          var response = result.data;

          bean = VetListResponseModel.fromJson(response);
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
  Future<Either<Failure, VetDetailsResponseModel>> getVetDetails(
      String veterinarianId) async {
    if (await networkInfo.isConnected) {
      try {
        late VetDetailsResponseModel bean;
        var result = await apiService.get("${Endpoints.vetDetailsGet}$veterinarianId");
        if (result.statusCode == 200) {
          var response = result.data;

          bean = VetDetailsResponseModel.fromJson(response);
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
  Future<Either<Failure, SlotListResponseModel>> getVetSlotList(
    String date,
    String vetId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        late SlotListResponseModel bean;
        var result =
            await apiService.get("${Endpoints.vetSlotListGet}date=$date&vet_id=$vetId");
        if (result.statusCode == 200) {
          var response = result.data;

          bean = SlotListResponseModel.fromJson(response);
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
  Future<Either<Failure, GeneralBean>> bookVetSlot(FormData formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(Endpoints.bookSlotPost,
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
