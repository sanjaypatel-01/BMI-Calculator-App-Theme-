import 'package:bmi_calculator_theme/Components/SecBtn.dart';
import 'package:bmi_calculator_theme/Controllers/BMIController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class weightSelector extends StatelessWidget {
  const weightSelector({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());
    return  Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        height: 220,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Weight",
              style: TextStyle(fontSize: 18, color:Theme.of(context).colorScheme.onSecondaryContainer),
            )],
          ),

          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                "${bmiController.weight.value}",
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color:Theme.of(context).colorScheme.onBackground),
              ))
            ],
          ),
          SizedBox(height: 9,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               SecBtn(onpress: () {
                 bmiController.weight.value++;
               }, icon: Icons.add),
              SecBtn(onpress: () {
                bmiController.weight.value--;
              }, icon: Icons.minimize)
            ],
          )
        ],)
    );
  }
}
