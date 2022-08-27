import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/controllers/language_controller.dart';
import 'package:ripple_car_frontend/app/enums/toast_enum.dart';
import 'package:ripple_car_frontend/app/i18n/i18n.dart';
import 'package:ripple_car_frontend/app/i18n/language_model.dart';
import 'package:ripple_car_frontend/app/modules/login/controllers/login_controller.dart';
import 'package:ripple_car_frontend/app/modules/login/models/login_credential_model.dart';
import 'package:ripple_car_frontend/app/routes/app_routes.dart';
import 'package:ripple_car_frontend/app/themes/app_text_theme.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';
import 'package:ripple_car_frontend/app/utils/functions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginCredentialModel credential = LoginCredentialModel();
    final LoginController controller = Get.find<LoginController>();

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(loginImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black12,
                Colors.black87,
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: _appBarLanguageDropdown(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 0,
                        color: Colors.white.withOpacity(0.7),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                child: Image.asset(
                                  logoImage,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 60),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                onChanged: credential.setEmail,
                                validator: (value) =>
                                    credential.email.validate(),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                  errorMaxLines: 2,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Obx(
                                () => TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onChanged: credential.setPassword,
                                  validator: (value) =>
                                      credential.password.validate(),
                                  obscureText: controller.isObscured.value,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'Senha',
                                    errorMaxLines: 2,
                                    suffixIcon: IconButton(
                                      onPressed: () => controller.isObscured
                                          .value = !controller.isObscured.value,
                                      icon: Icon(
                                        controller.isObscured.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () async {
                                  final String? validate =
                                      credential.validate();
                                  if (validate == null) {
                                    await controller.login(credential);
                                    return;
                                  }
                                  showToast(validate, ToastEnum.error);
                                },
                                child: Text(
                                  'login.page.button.login'.tr,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      OutlinedButton(
                        onPressed: () =>
                            Get.toNamed<dynamic>(AppRoutes.register),
                        child: const Text(
                          'Registrar',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      OutlinedButton(
                        onPressed: () =>
                            Get.offAllNamed<dynamic>(AppRoutes.home),
                        child: const Text(
                          'Ir para Home',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      OutlinedButton(
                        onPressed: () => Get.toNamed<dynamic>(AppRoutes.garage),
                        child: const Text(
                          'Ir para Garagem',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const OutlinedButton(
                        onPressed: launchDiscord,
                        child: Text(
                          'Ir para Discord',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBarLanguageDropdown() {
    final LanguageController languageController =
        Get.find<LanguageController>();

    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Theme(
        data: ThemeData.dark(),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<LanguageModel>(
            value: languageController.selectedLanguage.value,
            items: I18n.languages
                .map(
                  (item) => DropdownMenuItem<LanguageModel>(
                    value: item,
                    child: Text(
                      item.language,
                      style: poppinsRegular().copyWith(color: Colors.white),
                    ),
                  ),
                )
                .toList(),
            onChanged: (LanguageModel? languageModel) =>
                languageController.changeLanguage(languageModel!),
          ),
        ),
      ),
    );
  }
}
