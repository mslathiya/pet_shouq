import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;

import '../service/repository/repository.dart';

class MedicalHistoryController extends GetxController implements GetxService {
  final MedicalHistoryRepositoryImpl repository;
  final int petId;
  bool inEditMode = false;
  bool isLoading = false;

  final GlobalKey<FormState> _historyAddEditKey = GlobalKey<FormState>();

  GlobalKey<FormState> get historyAddEditKey => _historyAddEditKey;

  MedicalHistoryController({
    required this.repository,
    required this.petId,
  });
}
