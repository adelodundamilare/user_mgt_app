class ModelRegisterUser {
  String? status;
  String? message;
  int? voterID;
  String? mobile;

  ModelRegisterUser({this.status, this.message, this.voterID, this.mobile});

  ModelRegisterUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    voterID = json['voterID'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['voterID'] = voterID;
    data['mobile'] = mobile;
    return data;
  }
}
