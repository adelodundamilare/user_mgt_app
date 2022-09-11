class ModelUser {
  String? status;
  String? message;
  Data? data;
  String? imgBaseUrl;

  ModelUser({this.status, this.message, this.data, this.imgBaseUrl});

  ModelUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    imgBaseUrl = json['img_base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['img_base_url'] = this.imgBaseUrl;
    return data;
  }
}

class Data {
  String? mobilizerID;
  String? pvcNumber;
  String? pvcStatus;
  String? pvcStatusDate;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? password;
  String? mobile;
  String? mobileDialCode;
  String? mobileIsoCode2;
  String? mobileStatus;
  String? mobileOtp;
  String? dateMobileOTPsent;
  String? dateMobileStatus;
  String? country;
  String? state;
  String? lga;
  String? communityID;
  String? address;
  String? dateOfBirth;
  String? profileImg;
  String? dateRegistered;
  String? registrationMacAddress;
  String? registrationMedium;
  String? registrationAgent;
  String? registrationIp;
  String? status;
  String? emailToken;
  String? tokenDate;
  String? emailConfirmedStatus;
  String? emailConfirmDate;
  String? createdBy;
  String? lastModified;
  String? lastModifiedBy;

  Data(
      {this.mobilizerID,
      this.pvcNumber,
      this.pvcStatus,
      this.pvcStatusDate,
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.password,
      this.mobile,
      this.mobileDialCode,
      this.mobileIsoCode2,
      this.mobileStatus,
      this.mobileOtp,
      this.dateMobileOTPsent,
      this.dateMobileStatus,
      this.country,
      this.state,
      this.lga,
      this.communityID,
      this.address,
      this.dateOfBirth,
      this.profileImg,
      this.dateRegistered,
      this.registrationMacAddress,
      this.registrationMedium,
      this.registrationAgent,
      this.registrationIp,
      this.status,
      this.emailToken,
      this.tokenDate,
      this.emailConfirmedStatus,
      this.emailConfirmDate,
      this.createdBy,
      this.lastModified,
      this.lastModifiedBy});

  Data.fromJson(Map<String, dynamic> json) {
    mobilizerID = json['mobilizerID'];
    pvcNumber = json['pvc_number'];
    pvcStatus = json['pvcStatus'];
    pvcStatusDate = json['pvcStatusDate'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    mobileDialCode = json['mobileDialCode'];
    mobileIsoCode2 = json['mobile_iso_code_2'];
    mobileStatus = json['mobileStatus'];
    mobileOtp = json['mobileOtp'];
    dateMobileOTPsent = json['dateMobileOTPsent'];
    dateMobileStatus = json['dateMobileStatus'];
    country = json['country'];
    state = json['state'];
    lga = json['lga'];
    communityID = json['communityID'];
    address = json['address'];
    dateOfBirth = json['dateOfBirth'];
    profileImg = json['profile_img'];
    dateRegistered = json['dateRegistered'];
    registrationMacAddress = json['registration_mac_address'];
    registrationMedium = json['registration_medium'];
    registrationAgent = json['registration_agent'];
    registrationIp = json['registration_ip'];
    status = json['status'];
    emailToken = json['email_token'];
    tokenDate = json['token_date'];
    emailConfirmedStatus = json['emailConfirmedStatus'];
    emailConfirmDate = json['emailConfirmDate'];
    createdBy = json['created_by'];
    lastModified = json['last_modified'];
    lastModifiedBy = json['last_modified_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobilizerID'] = this.mobilizerID;
    data['pvc_number'] = this.pvcNumber;
    data['pvcStatus'] = this.pvcStatus;
    data['pvcStatusDate'] = this.pvcStatusDate;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    data['mobileDialCode'] = this.mobileDialCode;
    data['mobile_iso_code_2'] = this.mobileIsoCode2;
    data['mobileStatus'] = this.mobileStatus;
    data['mobileOtp'] = this.mobileOtp;
    data['dateMobileOTPsent'] = this.dateMobileOTPsent;
    data['dateMobileStatus'] = this.dateMobileStatus;
    data['country'] = this.country;
    data['state'] = this.state;
    data['lga'] = this.lga;
    data['communityID'] = this.communityID;
    data['address'] = this.address;
    data['dateOfBirth'] = this.dateOfBirth;
    data['profile_img'] = this.profileImg;
    data['dateRegistered'] = this.dateRegistered;
    data['registration_mac_address'] = this.registrationMacAddress;
    data['registration_medium'] = this.registrationMedium;
    data['registration_agent'] = this.registrationAgent;
    data['registration_ip'] = this.registrationIp;
    data['status'] = this.status;
    data['email_token'] = this.emailToken;
    data['token_date'] = this.tokenDate;
    data['emailConfirmedStatus'] = this.emailConfirmedStatus;
    data['emailConfirmDate'] = this.emailConfirmDate;
    data['created_by'] = this.createdBy;
    data['last_modified'] = this.lastModified;
    data['last_modified_by'] = this.lastModifiedBy;
    return data;
  }
}
