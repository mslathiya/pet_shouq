import 'record_type_bean.dart';

class HistoryRequestBean {
  RecordTypeBean? recordType;
  List<HistoryRequestListItem> listArray;

  HistoryRequestBean({
    this.recordType,
    required this.listArray,
  });
}

class HistoryRequestListItem {
  String label;
  String value;

  HistoryRequestListItem({
    required this.label,
    required this.value,
  });

  HistoryRequestListItem.fromJson(Map<String, dynamic> json)
      : label = json['label'],
        value = json['value'];

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'value': value,
    };
  }
}
