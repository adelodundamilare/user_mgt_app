class RegisterUserRequestModel {
  String? mobile;
  String? password;
  String? voterip;
  String? macAddress;

  RegisterUserRequestModel(
      {this.mobile, this.password, this.voterip, this.macAddress});

  RegisterUserRequestModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    password = json['password'];
    voterip = json['voterip'];
    macAddress = json['mac_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = mobile;
    data['password'] = password;
    data['voterip'] = voterip;
    data['mac_address'] = macAddress;
    return data;
  }
}

class ReqResendOTP {
  String? mobile;

  ReqResendOTP({this.mobile});

  ReqResendOTP.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    return data;
  }
}

class RequestPasswordReset {
  String? mobile;

  RequestPasswordReset({this.mobile});

  RequestPasswordReset.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    return data;
  }
}

class ModelRequestLogin {
  String? mobile;
  String? password;

  ModelRequestLogin({this.mobile, this.password});

  ModelRequestLogin.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    return data;
  }
}

class ReqVerifyAccountModel {
  String? mobile;
  String? otp;

  ReqVerifyAccountModel({this.mobile, this.otp});

  ReqVerifyAccountModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['otp'] = this.otp;
    return data;
  }
}

class ModelRequestCreatePassword {
  String? mobile;
  String? newPassword;
  String? otp;

  ModelRequestCreatePassword({this.mobile, this.newPassword, this.otp});

  ModelRequestCreatePassword.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    newPassword = json['new_password'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['new_password'] = this.newPassword;
    data['otp'] = this.otp;
    return data;
  }
}

class ModelRequestVerifyPVC {
  String? voterID;
  String? pvcNumber;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? gender;
  String? stateID;
  String? lgaID;
  String? ward;
  String? pollingUnit;
  String? religion;

  ModelRequestVerifyPVC(
      {this.voterID,
      this.pvcNumber,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.gender,
      this.stateID,
      this.lgaID,
      this.ward,
      this.pollingUnit,
      this.religion});

  ModelRequestVerifyPVC.fromJson(Map<String, dynamic> json) {
    voterID = json['voterID'];
    pvcNumber = json['pvc_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    stateID = json['stateID'];
    lgaID = json['lgaID'];
    ward = json['ward'];
    pollingUnit = json['polling_unit'];
    religion = json['religion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voterID'] = this.voterID;
    data['pvc_number'] = this.pvcNumber;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['stateID'] = this.stateID;
    data['lgaID'] = this.lgaID;
    data['ward'] = this.ward;
    data['polling_unit'] = this.pollingUnit;
    data['religion'] = this.religion;
    return data;
  }
}

class ModelRequestProfile {
  String? voterID;

  ModelRequestProfile({this.voterID});

  ModelRequestProfile.fromJson(Map<String, dynamic> json) {
    voterID = json['voterID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voterID'] = this.voterID;
    return data;
  }
}

class ModelRequestEditProfile {
  String? voterID;
  String? email;
  String? firstName;
  String? lastName;
  String? country;
  String? state;
  String? lga;
  String? address;
  String? passwordChange;
  String? password;
  String? profileImg;

  ModelRequestEditProfile(
      {this.voterID,
      this.email,
      this.firstName,
      this.lastName,
      this.country,
      this.state,
      this.lga,
      this.address,
      this.profileImg,
      this.passwordChange,
      this.password});

  ModelRequestEditProfile.fromJson(Map<String, dynamic> json) {
    voterID = json['voterID'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    country = json['country'];
    state = json['state'];
    profileImg = json['profile_img'];

    lga = json['lga'];
    address = json['address'];
    passwordChange = json['password_change'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voterID'] = this.voterID;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['country'] = this.country;
    data['state'] = this.state;
    data['lga'] = this.lga;
    data['profile_img'] = this.profileImg;
    data['address'] = this.address;
    data['password_change'] = this.passwordChange;
    data['password'] = this.password;
    return data;
  }
}

class ModelRequestFetchStateLGA {
  String? stateID;

  ModelRequestFetchStateLGA({this.stateID});

  ModelRequestFetchStateLGA.fromJson(Map<String, dynamic> json) {
    stateID = json['stateID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stateID'] = this.stateID;
    return data;
  }
}

class ModelRequestFetchCommunity {
  String? lga;

  ModelRequestFetchCommunity({this.lga});

  ModelRequestFetchCommunity.fromJson(Map<String, dynamic> json) {
    lga = json['lga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lga'] = this.lga;
    return data;
  }
}

class ModelRequestJoinCommunity {
  String? stateID;
  String? lgaID;
  String? communityID;
  String? voterID;

  ModelRequestJoinCommunity(
      {this.stateID, this.lgaID, this.communityID, this.voterID});

  ModelRequestJoinCommunity.fromJson(Map<String, dynamic> json) {
    stateID = json['stateID'];
    lgaID = json['lgaID'];
    communityID = json['communityID'];
    voterID = json['voterID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stateID'] = this.stateID;
    data['lgaID'] = this.lgaID;
    data['communityID'] = this.communityID;
    data['voterID'] = this.voterID;
    return data;
  }
}

class ModelRequestJoinEvent {
  String? voterID;
  String? eventID;

  ModelRequestJoinEvent({this.voterID, this.eventID});

  ModelRequestJoinEvent.fromJson(Map<String, dynamic> json) {
    voterID = json['voterID'];
    eventID = json['eventID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voterID'] = this.voterID;
    data['eventID'] = this.eventID;
    return data;
  }
}

class ModelRequestPollingUnits {
  String? wardID;

  ModelRequestPollingUnits({this.wardID});

  ModelRequestPollingUnits.fromJson(Map<String, dynamic> json) {
    wardID = json['wardID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wardID'] = this.wardID;
    return data;
  }
}
