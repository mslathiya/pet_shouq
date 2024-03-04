import 'package:dartz/dartz.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:pet_shouq/data/model/calender_list_reponse_model.dart';
import 'package:pet_shouq/data/model/failure.dart';
import 'package:pet_shouq/service/api/api_imports.dart';

abstract class CalenderListRepository {
  Future<Either<Failure, CalenderListResponseModel>> getCalenderList(
      Map<String, dynamic> formFields);
}

class CalenderListRepositoryImpl extends CalenderListRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;

  CalenderListRepositoryImpl({
    required this.networkInfo,
    required this.apiService,
  });

  @override
  Future<Either<Failure, CalenderListResponseModel>> getCalenderList(
      Map<String, dynamic> formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late CalenderListResponseModel bean;
        var result = await apiService.get(Endpoints.calenderListGet,
            queryParameters: formFields);
        if (result.statusCode == 200) {
          var response = result.data;

          bean = CalenderListResponseModel.fromJson(response);
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
