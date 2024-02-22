import 'package:dartz/dartz.dart';

import '../../data/model/models.dart';
import '../api/api_imports.dart';

abstract class MedicalHistoryRepository {
  Future<Either<Failure, GeneralBean>> addMedicalHistory(
    Map<String, dynamic> requestField,
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
      Map<String, dynamic> requestField) async {
    // TODO: implement addMedicalHistory
    throw UnimplementedError();
  }
}
