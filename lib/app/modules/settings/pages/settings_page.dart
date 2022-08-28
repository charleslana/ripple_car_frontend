import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/components/custom_app_bar.dart';
import 'package:ripple_car_frontend/app/components/loop_animation.dart';
import 'package:ripple_car_frontend/app/controllers/language_controller.dart';
import 'package:ripple_car_frontend/app/i18n/i18n.dart';
import 'package:ripple_car_frontend/app/i18n/language_model.dart';
import 'package:ripple_car_frontend/app/modules/login/controllers/login_controller.dart';
import 'package:ripple_car_frontend/app/themes/app_text_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Definições',
        isHome: true,
      ),
      body: Stack(
        children: [
          const LoopAnimation(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text('Idiomas'),
                  const SizedBox(height: 20),
                  Column(
                    children: _createRadioListLanguages(),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: loginController.logout,
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _createRadioListLanguages() {
    final LanguageController languageController =
        Get.find<LanguageController>();
    final List<Widget> widgets = [];

    for (final element in I18n.languages) {
      widgets.add(
        RadioListTile<LanguageModel>(
          value: element,
          groupValue: languageController.selectedLanguage.value,
          title: Text(
            element.language,
            style: poppinsRegular().copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            element.language,
            style: poppinsRegular().copyWith(fontWeight: FontWeight.bold),
          ),
          onChanged: (LanguageModel? languageModel) =>
              languageController.changeLanguage(languageModel!),
          selected: languageController.selectedLanguage.value == element,
          activeColor: Colors.green,
        ),
      );
    }

    return widgets;
  }
}
