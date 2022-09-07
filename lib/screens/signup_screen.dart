import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/screens/assessment_screen.dart';
import 'package:tujimind/widgets/custom_button.dart';
import 'package:tujimind/widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/images/tujimind_logo1.png",
                      width: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: const [
                          Text(
                            "Welcome",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "Tujimind is your safe space",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SignupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = false;
  bool confirmPasswordVisibility = false;

  List<String> values = [
    "Workplace",
    "Home",
  ];
  String initialValue = "Workplace";

  bool agreeToTerms = false;

  void validateForm() {
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: _formKey,
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      title: "You Nick Name",
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a name";
                        }
                        return "";
                      },
                      onChanged: (value) {
                        validateForm();
                      },
                    ),
                    CustomTextField(
                      title: "Email",
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (!value!.contains("@")) {
                          return "Should be a valid email";
                        }
                        return "";
                      },
                      onChanged: (value) {
                        validateForm();
                      },
                    ),
                    CustomTextField(
                      title: "Telephone No.",
                      prefixIcon: CountryCodePicker(
                        onChanged: print,
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                        showDropDownButton: true,
                        hideSearch: true,
                        dialogSize: const Size(300, 500),
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.length < 9) {
                          return "Should be at lease 9 characters";
                        }
                        return "";
                      },
                      onChanged: (value) {
                        validateForm();
                      },
                    ),
                    CustomTextField(
                      controller: passwordController,
                      title: "Password",
                      suffixIcon: GestureDetector(
                        child: Icon(passwordVisibility
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash),
                        onTap: () {
                          setState(() {
                            passwordVisibility = !passwordVisibility;
                          });
                        },
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !passwordVisibility,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        String message = "";
                        if (value!.length < 4) {
                          message += "should be at least 4 characters\n";
                        }
                        if (!value.contains(RegExp("[A-Z]"))) {
                          message += "should contain uppercase letters\n";
                        }
                        if (!value.contains(RegExp("[a-z]"))) {
                          message += "should contain lowercase letters\n";
                        }
                        if (!value.contains(RegExp("[0-9]"))) {
                          message += "should contain digits\n";
                        }
                        if (!value.contains(RegExp("[^a-zA-Z0-9]"))) {
                          message += "should contain a special character\n";
                        }
                        return message;
                      },
                      onChanged: (value) {
                        validateForm();
                      },
                    ),
                    CustomTextField(
                      title: "Confirm Password",
                      suffixIcon: GestureDetector(
                        child: Icon(confirmPasswordVisibility
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash),
                        onTap: () {
                          setState(() {
                            confirmPasswordVisibility =
                                !confirmPasswordVisibility;
                          });
                        },
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !confirmPasswordVisibility,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value != passwordController.text) {
                          return "Passwords do not match";
                        }
                        return "";
                      },
                      onChanged: (value) {
                        validateForm();
                      },
                    ),
                    CustomTextField(
                      title: "Organization",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DropdownButton(
                          isDense: true,
                          value: initialValue,
                          underline: const SizedBox.shrink(),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          onChanged: (dynamic value) {
                            setState(() {
                              initialValue = value;
                            });
                          },
                          items: List.generate(
                            values.length,
                            (index) => DropdownMenuItem(
                              value: values[index],
                              child: Text(values[index]),
                            ),
                          ),
                        ),
                      ),
                      hintText: "Kindly use your work email address",
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                CustomButton(
                  onPressed: agreeToTerms
                      ? () {
                          validateForm();
                          Navigator.pushReplacementNamed(context, AssessmentScreen.id);
                  }
                      : null,
                  child: const Text("Sign Up"),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          agreeToTerms = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        maxLines: 2,
                        text: TextSpan(
                          text:
                              "I agree to the use of my data and communication "
                              "from Tujimind app per the ",
                          style: Theme.of(context).textTheme.bodySmall,
                          children: [
                            TextSpan(
                              text: "Terms & Privacy Policy",
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Hi there!");
                                },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "Have an Account? ",
              style: const TextStyle(fontSize: 14, color: Colors.blue),
              children: [
                TextSpan(
                  text: "Sign In",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("Hi");
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
