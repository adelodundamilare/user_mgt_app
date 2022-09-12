import 'package:flutter/material.dart';
import 'package:ryalize/extensions/ryalize_color_scheme.dart';

// texts
const String kThemeLocal = 'THEME_DATA';
const String kAppName = 'UserManagementApp';

// spacing
const double kSpacingSmall = 10;
const double kSpacingMedium = 20;
const double kSpacingLarge = 40;
const double kSpacingDisplaceBottom = 80;
const double kSpacingExtraLarge = 150;

// Border
const BorderRadius kBorderRadius =
    BorderRadius.all(Radius.circular(kSpacingSmall));
const BorderRadius kBorderRadiusSmall = BorderRadius.all(Radius.circular(5));
const BorderRadius kBorderRadiusLarge =
    BorderRadius.all(Radius.circular(kSpacingLarge));
const BorderRadius kBorderRadiusFull = BorderRadius.all(Radius.circular(100));

// Box Shadow
BoxShadow kBoxShadow(Color color) => BoxShadow(
      color: color,
      spreadRadius: 0,
      blurRadius: 15,
      offset: const Offset(0, 2), // changes position of shadow
    );

// Colors
const Color kColorPrimary = Color(0xFF8E24AA);
const Color kColorPrimaryDark = Color(0xFFE91E63);
const Color kColorTransparent = Colors.transparent;
const Color kColorAccent = Color(0xFF48C1EA);
const Color kColorPrimaryText = Colors.black;
const Color kColorWhite = Colors.white;
const Color kSecondaryTextColor = Colors.white;
const Color kScaffoldBackgroundColor = Colors.white;
const Color kColorBlack = Colors.black;
const Color kColorRed = Color(0xFFE62B34);
const Color kColorDarkGrey = Color(0xFF707070);
const Color kColorGrey = Color(0xFFECECEC);

// GRADIENTS
const LinearGradient kPrimaryGradient = LinearGradient(
    colors: [kColorPrimary, kColorPrimaryDark],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    stops: [0.3, 1.0],
    tileMode: TileMode.clamp);

const LinearGradient kGreenGradient = LinearGradient(
    colors: [Color(0xFF3AA555), Color(0xFF00E941)],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    stops: [0.3, 1.0],
    tileMode: TileMode.clamp);

const LinearGradient kBlackGradient = LinearGradient(
    colors: [Colors.black12, Colors.black38],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    stops: [0.3, 1.0],
    tileMode: TileMode.clamp);

// FontSize
const double kFontSizeSmall = 12;
const double kFontSizeNormal = 14;
const double kFontSizeAverage = 16;
const double kFontSizeMedium = 18;
const double kFontSizeBig = 24;
const double kFontSizeLarge = 28;
const double kFontSizeIcon = 24;
const double kFontSizeIconBig = 34;

// fonts
const String kFontFamilyRegular = 'GTWalsheimProRegular';
const String kFontFamilyBold = 'GTWalsheimProBold';

// Text
const TextStyle kHeadline1TextStyle = TextStyle(
  color: kColorPrimaryText,
  fontFamily: kFontFamilyBold,
  fontSize: kFontSizeLarge,
  height: 1.2,
);
const TextStyle kHeadline2TextStyle = TextStyle(
    fontSize: kFontSizeLarge,
    fontWeight: FontWeight.normal,
    color: kColorPrimaryText);
const TextStyle kHeadline3TextStyle = TextStyle(
    fontSize: kFontSizeBig,
    fontWeight: FontWeight.bold,
    color: kColorPrimaryText);
const TextStyle kBodyText1Style =
    TextStyle(fontSize: kFontSizeMedium, color: kColorPrimaryText);
const TextStyle kBodyText2Style =
    TextStyle(fontSize: kFontSizeNormal, color: kColorPrimaryText);
const TextStyle kBodyText3Style = TextStyle(
    fontSize: kFontSizeNormal,
    fontWeight: FontWeight.bold,
    fontFamily: kFontFamilyRegular,
    color: kColorPrimaryText);
const TextStyle kSubtitle1Style = TextStyle(
    fontSize: kFontSizeSmall,
    fontFamily: kFontFamilyRegular,
    color: kColorBlack);
const TextStyle kSubtitle2Style = TextStyle(
    fontSize: kFontSizeSmall,
    fontFamily: kFontFamilyRegular,
    color: kColorPrimaryText);

// Theme
final ThemeData kThemeData = ThemeData.light().copyWith(
    primaryColor: kColorPrimary,
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    dividerColor: Colors.grey[350]!,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dialogBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(size: kFontSizeIcon, color: kColorWhite),
    textTheme: TextTheme(
        headline1: kHeadline1TextStyle.copyWith(color: Colors.black),
        headline2: kHeadline2TextStyle.copyWith(color: Colors.black),
        headline3: kHeadline3TextStyle.copyWith(color: Colors.black),
        bodyText1: kBodyText1Style.copyWith(color: Colors.black),
        bodyText2: kBodyText2Style.copyWith(color: Colors.black),
        subtitle1: kSubtitle1Style.copyWith(color: Colors.black),
        subtitle2: kSubtitle2Style.copyWith(color: Colors.black)));

final ThemeData kThemeDataDark = ThemeData.dark().copyWith(
    primaryColor: kColorPrimary,
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    dividerColor: Colors.grey[350]!,
    dialogBackgroundColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: const IconThemeData(size: kFontSizeIcon, color: kColorWhite),
    textTheme: TextTheme(
      headline1: kHeadline1TextStyle.copyWith(color: Colors.white),
      headline2: kHeadline2TextStyle.copyWith(color: Colors.white),
      headline3: kHeadline3TextStyle.copyWith(color: Colors.white),
      bodyText1: kBodyText1Style.copyWith(color: Colors.white),
      bodyText2: kBodyText2Style.copyWith(color: Colors.white),
      subtitle1: kSubtitle1Style.copyWith(color: Colors.white),
      subtitle2: kSubtitle2Style.copyWith(color: Colors.white),
      caption: kBodyText1Style.copyWith(color: Colors.white),
      button: kBodyText1Style.copyWith(color: Colors.white),
      overline: kBodyText1Style.copyWith(color: Colors.white),
    ));

// Routes
const kRouteGetStarted = "/"; //delete this...
const kRouteLogin = '/login';
const kRouteCreateAccount = "/create-account";
const kRouteHome = "/home";
const kRouteSettings = "/setting";

// Images
const String kImagesLogo = 'images/logo.png';
const String kImagesEmptyIcon = 'images/empty_icon.png';
const String kImagesRemotePlaceholder =
    'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg';

// width
double kWidthFull(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double kHeightFull(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

// padding
const EdgeInsetsGeometry kPaddingAllSmall = EdgeInsets.all(kSpacingSmall);
const EdgeInsetsGeometry kPaddingAllMedium = EdgeInsets.all(kSpacingMedium);
const EdgeInsetsGeometry kPaddingAllLarge = EdgeInsets.all(kSpacingLarge);

// Endpoint
const baseUrl = 'https://www.bat23.com/voterapi';
const kEndpointRegister = '$baseUrl/create-account';
const kEndpointVerifyAccount = '$baseUrl/verify-registration-otp';
const kEndpointResendOTP = '$baseUrl/resend-registration-otp';
const kEndpointLogin = '$baseUrl/validate-user';
const kEndpointRequestPasswordReset = '$baseUrl/request-reset-password';
const kEndpointCreatePassword = '$baseUrl/reset-password';
const kEndpointVerifyPVC = '$baseUrl/verify-pvc';
const kEndpointFetchProfile = '$baseUrl/fetch-voter-profile';
const kEndpointUpdateProfile = '$baseUrl/edit-voter-profile';
const kEndpointFetchLGAs = '$baseUrl/fetch-state-lga';
const kEndpointChangeToMobilizer = '$baseUrl/become-mobilizer';
const kEndpointSendEmailOTP = '$baseUrl/send-email-otp';
const kEndpointUploadProfilePics = '$baseUrl/upload-voter-profile-img';
const kEndpointVerifyEmailOTP = '$baseUrl/verify-email-otp';
const kEndpointResendEmailOTP = '$baseUrl/resend-email-otp';
