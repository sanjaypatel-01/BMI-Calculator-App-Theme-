import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIController extends GetxController {

  RxString Gender = "MALE".obs;
  RxInt weight = 45.obs;
  RxInt age = 21.obs;
  RxDouble height = 165.0.obs;
  RxDouble BMI = 0.0.obs;
  RxString BMIstatus = "".obs;
  RxString BMIdes = "".obs;
  Rx<Color> ColorStatus = Color(0xff246AFE).obs;

  void genderHandle(String gender){
    Gender.value = gender;
  }

  void CalculateBMI() {
    var Hmeter = height/100;
    BMI.value = weight/(Hmeter*Hmeter);
    //print(BMI);
    findStatus();
  }

  void findStatus(){
    if(BMI.value < 18.5)
      {
        BMIstatus.value = "Underweight";
        BMIdes.value = "indicating your weight is in the underweight category for adults of your height. It's important to address underweight concerns and ensure proper nutrition for overall well-being.";
        ColorStatus.value = Color(0xffFF8F3E);
      }
    else if(BMI.value > 18.5 && BMI.value < 24.9)
    {
      BMIstatus.value = "Normal";
      BMIdes.value = "indicating your weight is in the normal category for adults of your height. Maintaing a healthy wight may reduce the risk of chronic diseases associated with overweight and obesity.";
      ColorStatus.value = Color(0xff1D781B);
    }
    else if(BMI.value > 25.0 && BMI.value < 29.9)
    {
      BMIstatus.value = "Overweight";
      BMIdes.value = "indicating your weight is in the overweight category for adults of your height. Managing your weight through a balanced diet and regular physical activity can contribute to a healthier lifestyle.";
      ColorStatus.value = Colors.redAccent;
    }
    else if(BMI.value > 34.9)
    {
      BMIstatus.value = "Obese";
      BMIdes.value = "indicating your weight is in the obese category for adults of your height. Consultation with a healthcare professional for personalized advice is recommended."
      ;
      ColorStatus.value = Colors.red;
    }
  }

}















 /* RxBool isFemale = false.obs;
  RxBool isMale = false.obs;

  void genderHandle(String gender){
    if(gender== "male")
      {
        isMale.value = true;
        isFemale.value = false;
      }
    if(gender== "female")
    {
      isMale.value = false;
      isFemale.value = true;
    }
  }


  */