import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yara/pages/changepassword/model/changepasswordmodel.dart';
import 'package:yara/pages/dashboard/Model/dashboardmodel.dart';
import 'package:yara/pages/login/Model/tokenmodel.dart';
import 'package:yara/pages/login/Model/userloginmodel.dart';
import 'package:yara/pages/model/responsemodel.dart';
import 'package:yara/pages/signup/Model/signupmodel.dart';

part 'apiservices.g.dart';

@RestApi(baseUrl: 'https://feasible-intensely-sawfly.ngrok-free.app/api/v1/app')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @POST('/login')
  Future<TokenModel> loginUser(@Body() UsersLoginModel loginrequest);

  @POST('/signup')
  Future<ResponseModel> signup(@Body() SignUpModel signuprequest);

  @POST('/forgotpassword')
  Future<ResponseModel> forgotPassword();

  @GET('/user/getdashboard')
  Future<DashboardData> dashoardData();

  @POST('/recharge')
  Future<dynamic> recharge(
    @Field('mobile') String mobile,
    @Field('operator') String operator,
    @Field('amount') String amount,
  );

  @POST('/user/kycupdate')
  Future<dynamic> kycUpdate();

  @GET('/user/bankdetails')
  Future<dynamic> bankDetails();

  @POST('/user/changepassword')
  Future<ResponseModel> changePassword(
    @Body() ChangePasswordModel changePasswordRequest,
  );

  @GET('/user/contactus')
  Future<dynamic> contactUs();

  @POST('/user/generateqrcode')
  Future<dynamic> generateQRCode();

  @POST('/user/updateprofile')
  Future<dynamic> updateProfile();

  @POST('/user/logout')
  Future<ResponseModel> logout();

  @POST('/user/generateorderupi')
  Future<dynamic> generateOrderUPI();
}
