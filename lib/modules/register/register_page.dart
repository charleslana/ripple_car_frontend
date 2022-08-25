import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/modules/register/controller/register_controller.dart';
import 'package:ripple_car_frontend/modules/register/models/register_model.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterModel register = RegisterModel();
    final RegisterController controller = Get.find<RegisterController>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: register.setEmail,
                validator: (value) => register.email.validate(),
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                  errorMaxLines: 2,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: register.setName,
                validator: (value) => register.name.validate(),
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                  errorMaxLines: 4,
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: register.setPassword,
                  validator: (value) => register.password.validate(),
                  keyboardType: TextInputType.name,
                  obscureText: controller.isObscuredPassword.value,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Senha',
                    errorMaxLines: 2,
                    suffixIcon: IconButton(
                      onPressed: () => controller.isObscuredPassword.value =
                          !controller.isObscuredPassword.value,
                      icon: Icon(
                        controller.isObscuredPassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: register.setConfirmPassword,
                  validator: (value) => register.confirmPassword
                      .validate(register.password.value),
                  keyboardType: TextInputType.name,
                  obscureText: controller.isObscuredConfirmPassword.value,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Confirme a senha',
                    errorMaxLines: 2,
                    suffixIcon: IconButton(
                      onPressed: () => controller.isObscuredConfirmPassword
                          .value = !controller.isObscuredConfirmPassword.value,
                      icon: Icon(
                        controller.isObscuredConfirmPassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  final validate = register.validate();
                  if (validate == null) {
                    await controller.register(register);
                  } else {
                    print(validate);
                  }
                },
                child: const Text('Registrar'),
              ),
              const SizedBox(height: 30),
              OutlinedButton(
                onPressed: Get.back<dynamic>,
                child: const Text('Voltar para login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
