
import 'constants.dart';

class SocialModel {
  String? accessToken;
  String? appleUserToken;
  String? id;
  String? username;
  String? full_name;
  String? profile_picture;
  String? email;
  socialLogin? platform;
  String? first_name;
  String? last_name;
  int? status;
  String? error;

  SocialModel.fromMap(Map json){
    accessToken = json['access_token'];
    id = json['user']['id'];
    username = json['user']['username'];
    full_name = json['user']['full_name'];
    profile_picture = json['user']['profile_picture'];
    platform = json['user']['platform'];
    first_name = json['user']['first_name'];
    last_name = json['user']['last_name'];
  }

  SocialModel({this.accessToken, this.id, this.username, this.full_name,
    this.profile_picture, this.email,this.platform,this.first_name,this.last_name,this.appleUserToken,this.error,this.status});
}