// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;
import 'package:pet_shouq/data/model/booking_history_details_response_model.dart';
import 'package:pet_shouq/data/model/booking_history_reponse_model.dart';
import 'package:pet_shouq/data/model/vat_details_response_model.dart';
import 'package:pet_shouq/data/model/vet_list_response_model.dart';
import 'package:pet_shouq/data/model/vet_slot_data_response_mode;.dart';

import '../../data/model/models.dart';
import '../api/api_imports.dart';

abstract class BookingHistoryRepository {
  Future<Either<Failure, BookingHistoryResponseModel>> getBookingHistoryList(
      Map<String, dynamic> formFields);

  Future<Either<Failure, BookingHistoryDetailsResponseModel>>
      getBookingHistoryDetailsList(String bookingId);
}

class BookingHistoryRepositoryImpl extends BookingHistoryRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;

  BookingHistoryRepositoryImpl({
    required this.networkInfo,
    required this.apiService,
  });

  @override
  Future<Either<Failure, BookingHistoryResponseModel>> getBookingHistoryList(
      Map<String, dynamic> formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late BookingHistoryResponseModel bean;
        var result = await apiService.get(Endpoints.bookingHistoryGet,
            queryParameters: formFields);
        if (result.statusCode == 200) {
          var response = result.data;

          bean = BookingHistoryResponseModel.fromJson(response);
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
  Future<Either<Failure, BookingHistoryDetailsResponseModel>>
      getBookingHistoryDetailsList(String bookingId) async {
    if (await networkInfo.isConnected) {
      try {
        late BookingHistoryDetailsResponseModel bean;
        var result =
            await apiService.get("${Endpoints.bookingHistoryDetailsGet}$bookingId");
        if (result.statusCode == 200) {
          var response = result.data;

          bean = BookingHistoryDetailsResponseModel.fromJson(response);
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

  Future<Either<Failure, GeneralBean>> rescheduleAppointmentSlot(FormData formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(Endpoints.rescheduleAppointmentPost,
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
