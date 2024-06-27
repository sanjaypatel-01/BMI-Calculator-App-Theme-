import 'package:flutter/material.dart';
import 'package:bmi_calculator_theme/Controllers/ThemeController.dart';
import 'package:get/get.dart';

class ThemeChangeButton extends StatelessWidget {
  const ThemeChangeButton({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return         Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(

          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {
              themeController.changeTheme();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.light_mode,
                color: themeController.isDark.value
                    ? Theme.of(context).colorScheme.onSecondaryContainer
                    : Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  width: 25,
                  height: 40,
                ),
                Icon(Icons.dark_mode,
                  color: themeController.isDark.value
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ],
            ),
          ),
        )
      ],);
  }
}
