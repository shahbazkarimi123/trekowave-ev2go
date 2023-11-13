import 'dart:io';

class SignupData{                 
  String? userName;
  var phone;
  String? email;
  String? password;
  String? confirmPassword;
  String? phoneNo2;
  String? address;
  String? guarantor1Name;
  var guarantor1PhNo;
  String? guarantor1Address;
  String? guarantor2Name;
  var guarantor2PhNo;
  String? guarantor2Address;
  File? image0;
  File? image1;
  File? image2;
  File? image3;
  File? image4;
  File? image5;
  File? image6;
  File? image7;

  SignupData({
    this.userName,
    this.phone,this.password,
    this.confirmPassword,
    this.phoneNo2,
    this.address,
    this.guarantor1Address,
    
    });
  

}

class RechargeInfo{
  String? index;
  String? amount;
  RechargeInfo({this.index,this.amount});
}