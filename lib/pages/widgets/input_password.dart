import 'package:flutter/material.dart';
import 'package:proyecto_flic/values/colors.dart';
import 'package:proyecto_flic/values/strings.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController passwordController;
  final String labelText;
  const InputPassword({
    super.key,
    required this.passwordController,
    required this.labelText,
  });

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool passToogle = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: passToogle,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: AppColors.blue),
        filled: true,
        //fillColor: colorInputFill,
        helperText: "",
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        prefixIcon: const Icon(Icons.lock),
        prefixIconColor: AppColors.blue,
        suffixIcon: InkWell(
          onTap: () {
            passToogle = !passToogle;
            setState(() {});
          },
          child: Icon(passToogle ? Icons.visibility : Icons.visibility_off),
        ),
        suffixIconColor: AppColors.blue,
      ),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return AppStrings.requiredFieldText;
        }
        if (value.length < 6) {
          return AppStrings.passwordLeghtText;
        }
        return null;
      },
    );
  }
}