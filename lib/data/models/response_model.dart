class ResponseModel {
  Status? status;
  var data;

  ResponseModel({this.status, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }
}

class Status {
  String? timestamp;
  int? errorCode;
  String? errorMessage;
  int? totalCount;

  Status(
      {this.timestamp,
      this.errorCode,
      this.errorMessage,
      this.totalCount});

  Status.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    errorMessage = json['error_message'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['error_code'] = errorCode;
    data['error_message'] = errorMessage;
    data['total_count'] = totalCount;
    return data;
  }
}