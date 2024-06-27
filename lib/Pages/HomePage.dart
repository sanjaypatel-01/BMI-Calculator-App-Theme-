
import 'package:bmi_calculator_theme/Components/AgeSelector.dart';
import 'package:bmi_calculator_theme/Components/HeightSelector.dart';
import 'package:bmi_calculator_theme/Components/RactButton.dart';
import 'package:bmi_calculator_theme/Components/WeightSelector.dart';
import 'package:bmi_calculator_theme/Controllers/BMIController.dart';
import 'package:bmi_calculator_theme/Pages/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_theme/Components/ThemeChangeButton.dart';
import 'package:bmi_calculator_theme/Components/PrimaryButton.dart';
import 'package:get/get.dart';
import 'HomePage.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    BMIController bmiController = Get.put(BMIController());
    return Scaffold(
     body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const ThemeChangeButton(),
              Row(children: [
                Text("Welcome 😊", style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),)
              ],),
              Row(children: [
                Text("BMI Calculator", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onBackground),)
              ],),
              const SizedBox(height: 20 ),
              Row(children: [
                PrimaryButton(onPress: () {
                  bmiController.genderHandle("MALE");
                }, icon: Icons.male, btnName: "MALE",),
                const SizedBox(width: 20,),
                PrimaryButton(onPress: () {
                  bmiController.genderHandle("FEMALE");
                }, icon: Icons.male, btnName: "FEMALE",),

              ],
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  HeightSelector(),
                  SizedBox(width: 20,),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          weightSelector(),
                          ageSelector(),
                        ],
                      ),
                    )
                  ],),
              ),

              const SizedBox(height: 20,),
              MyRactButton(onPress: (){
                bmiController.CalculateBMI();
                Get.to(const ResultPage());
              }, btnName: "LETS GO", icon: Icons.done_all_rounded)
          ],
          ),
        ),
      ),
    );
  }
}