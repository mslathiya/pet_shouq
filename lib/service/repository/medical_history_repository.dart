import '../api/api_imports.dart';

abstract class MedicalHistoryRepository {}

class MedicalHistoryRepositoryImpl extends MedicalHistoryRepository {
  final NetworkInfo networkInfo;
  final ApiRepository apiService;

  MedicalHistoryRepositoryImpl({
    required this.networkInfo,
    required this.apiService,
  });
}
