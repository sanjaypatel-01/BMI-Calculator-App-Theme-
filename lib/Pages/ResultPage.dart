import 'package:bmi_calculator_theme/Components/RactButton.dart';
import 'package:bmi_calculator_theme/Controllers/BMIController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'HomePage.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Get.offAll(HomePage()); // Navigate to HomePage
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                        ),
                        Text("Back"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Your BMI is ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 1,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double circularSize =
                    constraints.maxWidth < 400 ? 135 : 200;
                    return CircularPercentIndicator(
                      footer: Text(
                        bmiController.BMIstatus.value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: bmiController.ColorStatus.value,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      radius: circularSize,
                      lineWidth: 32.0,
                      animation: true,
                      animationDuration: 1000,
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: bmiController.BMI.value / 100,
                      center: Text(
                        bmiController.BMI.value.toStringAsFixed(2),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: bmiController.ColorStatus.value,
                        ),
                      ),
                      backgroundColor: Colors.grey,
                      progressColor: bmiController.ColorStatus.value,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Your BMI is ${bmiController.BMI.value.toStringAsFixed(2)},  ${bmiController.BMIdes.value}, ",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "- By Sanjay Patel (MITS)",
                  style: TextStyle(
                    color: Colors.black45,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              MyRactButton(
                onPress: () {
                  Get.back();
                },
                btnName: "Find Out More",
                icon: Icons.arrow_back_ios_new,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
