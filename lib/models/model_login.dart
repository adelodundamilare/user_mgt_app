class ModelLogin {
  String? status;
  String? message;
  Data? data;

  ModelLogin({this.status, this.message, this.data});

  ModelLogin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? voterID;
  String? voterFirstname;
  String? voterLastname;

  Data({this.voterID, this.voterFirstname, this.voterLastname});

  Data.fromJson(Map<String, dynamic> json) {
    voterID = json['voterID'];
    voterFirstname = json['voterFirstname'];
    voterLastname = json['voterLastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voterID'] = this.voterID;
    data['voterFirstname'] = this.voterFirstname;
    data['voterLastname'] = this.voterLastname;
    return data;
  }
}
