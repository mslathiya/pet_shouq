import 'record_type_bean.dart';

class MedicalHistoryBean {
  RecordTypeBean? recordType;
  List<HistoryDataBean> listArray;

  MedicalHistoryBean({
    this.recordType,
    required this.listArray,
  });
}

class HistoryDataBean {
  String label;
  String value;

  HistoryDataBean({
    required this.label,
    required this.value,
  });

  HistoryDataBean.fromJson(Map<String, dynamic> json)
      : label = json['label'],
        value = json['value'];

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'value': value,
    };
  }
}
