import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;

import '../../data/model/models.dart';
import '../api/api_imports.dart';

abstract class SpecialNoteRepository {
  Future<Either<Failure, GeneralBean>> updateSpecialNotes(
    int petId,
    FormData formFields,
  );
}

class SpecialNoteRepositoryImpl extends SpecialNoteRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;

  SpecialNoteRepositoryImpl({
    required this.networkInfo,
    required this.apiService,
  });

  @override
  Future<Either<Failure, GeneralBean>> updateSpecialNotes(
      int petId, FormData formFields) async {
    if (await networkInfo.isConnected) {
      try {
        late GeneralBean bean;
        var result = await apiService.post(
            "${Endpoints.addPetSpecialNote}$petId",
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
