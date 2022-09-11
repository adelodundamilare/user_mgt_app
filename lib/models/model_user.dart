class ModelUser {
  String? status;
  String? message;
  Data? data;
  String? imgBaseUrl;

  ModelUser({this.status, this.message, this.data, this.imgBaseUrl});

  ModelUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    imgBaseUrl = json['img_base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['img_base_url'] = imgBaseUrl;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mobilizerID'] = mobilizerID;
    data['pvc_number'] = pvcNumber;
    data['pvcStatus'] = pvcStatus;
    data['pvcStatusDate'] = pvcStatusDate;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['email'] = email;
    data['password'] = password;
    data['mobile'] = mobile;
    data['mobileDialCode'] = mobileDialCode;
    data['mobile_iso_code_2'] = mobileIsoCode2;
    data['mobileStatus'] = mobileStatus;
    data['mobileOtp'] = mobileOtp;
    data['dateMobileOTPsent'] = dateMobileOTPsent;
    data['dateMobileStatus'] = dateMobileStatus;
    data['country'] = country;
    data['state'] = state;
    data['lga'] = lga;
    data['communityID'] = communityID;
    data['address'] = address;
    data['dateOfBirth'] = dateOfBirth;
    data['profile_img'] = profileImg;
    data['dateRegistered'] = dateRegistered;
    data['registration_mac_address'] = registrationMacAddress;
    data['registration_medium'] = registrationMedium;
    data['registration_agent'] = registrationAgent;
    data['registration_ip'] = registrationIp;
    data['status'] = status;
    data['email_token'] = emailToken;
    data['token_date'] = tokenDate;
    data['emailConfirmedStatus'] = emailConfirmedStatus;
    data['emailConfirmDate'] = emailConfirmDate;
    data['created_by'] = createdBy;
    data['last_modified'] = lastModified;
    data['last_modified_by'] = lastModifiedBy;
    return data;
  }
}
