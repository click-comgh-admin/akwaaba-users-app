import 'package:akwaaba_user_app/imports/classes/forms/validation/field.dart';
import 'package:akwaaba_user_app/imports/classes/forms/validation/manager.dart';
import 'package:akwaaba_user_app/imports/classes/forms/validation/non_field.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/form/main.dart';
import 'package:akwaaba_user_app/imports/widgets/forms/field/main.dart';
import 'package:akwaaba_user_app/view_models/users/login/main.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormLoginWidget extends StatefulWidget {
  const FormLoginWidget({Key? key}) : super(key: key);

  @override
  State<FormLoginWidget> createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends State<FormLoginWidget> {
  TextEditingController emailPhoneController = TextEditingController();
  bool emailPhoneHasError = false;
  TextEditingController passwordController = TextEditingController();
  bool passwordHasError = false;

  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  late Map<String, FieldValidationForm> listFields;

  final emailPhoneField = FieldValidationForm(
    hasError: false,
    identify: "phone_email",
    messages: ["Please enter email address/ phone number!"],
  );
  final passwordField = FieldValidationForm(
    hasError: false,
    identify: "password",
    messages: ["Please enter password!"],
  );

  @override
  void dispose() {
    emailPhoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    emailPhoneField.controller = emailPhoneController;
    passwordField.controller = passwordController;
    listFields = _listFields();

    // Start listening to changes.
    emailPhoneField.controller!.addListener(_printLatestValue);
    passwordField.controller!.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    // print(
    //     'emailPhoneController text field: ${emailPhoneField.controller!.text}');
    // print('passwordController text field: ${passwordField.controller!.text}');
  }

  Map<String, FieldValidationForm> _listFields() {
    return {
      emailPhoneField.identify: emailPhoneField,
      passwordField.identify: passwordField,
    };
  }

  @override
  Widget build(BuildContext context) {
    UserLoginViewModel userLoginViewModelCtx =
        context.watch<UserLoginViewModel>();

    FormValidationManager formValidationManager =
        context.watch<FormValidationManager>();

    formValidationManager.setListFields(listFields);
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Email/ Phone Number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizeboxHeight10FormConstantsUtilities,
                FieldFormWidget(
                  identify: Key(listFields[emailPhoneField.identify]!.identify),
                  child: TextFormField(
                    controller:
                        listFields[emailPhoneField.identify]!.controller,
                    keyboardType: TextInputType.text,
                    autocorrect: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      setState(() {
                        listFields[emailPhoneField.identify]!.hasError = false;
                      });
                    },
                    validator: (value) {
                      // print({"listFields-listFields-listFields": listFields});
                      if (value == null ||
                          value.isEmpty ||
                          listFields[emailPhoneField.identify]!.hasError) {
                        if (listFields[emailPhoneField.identify]!
                            .messages!
                            .isNotEmpty) {
                          return listFields[emailPhoneField.identify]!
                              .messages![0];
                        }
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            sizeboxHeight10FormConstantsUtilities,
            sizeboxHeight10FormConstantsUtilities,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizeboxHeight10FormConstantsUtilities,
                FieldFormWidget(
                  identify: Key(listFields[passwordField.identify]!.identify),
                  child: TextFormField(
                    controller: listFields[passwordField.identify]!.controller,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_showPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      setState(() {
                        listFields[passwordField.identify]!.hasError = false;
                      });
                    },
                    validator: (value) {
                      // print({"listFields-listFields-listFields": listFields});
                      if (value == null ||
                          value.isEmpty ||
                          listFields[passwordField.identify]!.hasError) {
                        if (listFields[passwordField.identify]!
                            .messages!
                            .isNotEmpty) {
                          return listFields[passwordField.identify]!
                              .messages![0];
                        }
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: paddingFormConstantsUtilities,
              child: Row(
                children: [
                  sizeboxWidth10FormConstantsUtilities,
                  GestureDetector(
                    child: Text(
                      _showPassword ? "Hide Password" : "Show Password",
                    ),
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                  sizeboxWidth10FormConstantsUtilities,
                  Checkbox(
                    value: _showPassword,
                    onChanged: (value) {
                      // print({"value": value, "_showPassword": _showPassword});
                      setState(() {
                        _showPassword = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Logging In...')),
                    );
                    var userLoginSuccess =
                        await userLoginViewModelCtx.userLogin(
                      emailPhone: emailPhoneController.text,
                      password: passwordController.text,
                    );

                    if (userLoginSuccess) {
                      // UserLoginModel userLoginModel =
                      //     userLoginViewModelCtx.userLoginModel;
                      // print({"userLoginModel": userLoginModel.toString()});
                      userLoginViewModelCtx.nF(); //LOGIN
                    } else {
                      NetworkFailure networkFailure =
                          userLoginViewModelCtx.networkFailure;
                      formValidationManager
                          .validationErrors(networkFailure.data!);

                      if (formValidationManager.fieldErrors.isNotEmpty) {
                        Map<String, FieldValidationForm> fieldErrors =
                            formValidationManager.fieldErrors;
                        // print({
                        //   "fieldErrors": _formValidationManager.fieldErrors,
                        // });
                        for (final identity in fieldErrors.keys) {
                          var field = fieldErrors[identity];
                          // print({"field": field});
                          // print({"listFields[identity]!.identify": listFields[identity]!.identify});
                          // print({"identity": identity});
                          if (listFields[identity]!.identify == identity) {
                            // listFields[identity]!.messages =
                            //     fieldErrors[identity]!.messages;
                            // print({"listFields[identity]-1": listFields[identity]});
                            setState(() {
                              listFields[identity] = field!;
                            });
                            _formKey.currentState!.validate();
                            // print({
                            //   "listFields[identity]-2": listFields[identity]
                            // });
                          }
                        }
                      }

                      if (formValidationManager.nonFieldErrors.isNotEmpty) {
                        List<NonFieldValidationForm> nonFieldErrors =
                            formValidationManager.nonFieldErrors;
                        // print({
                        //   "nonFieldErrors": _formValidationManager.nonFieldErrors,
                        // });

                        await ArtSweetAlert.show(
                          barrierDismissible: false,
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                              showCancelBtn: false,
                              confirmButtonText: "Close",
                              confirmButtonColor: Colors.grey,
                              type: ArtSweetAlertType.warning,
                              title: "Do you want to save the changes?",
                              customColumns: nonFieldErrors
                                  .map((e) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(e.messages),
                                      ))
                                  .toList()),
                        );
                      }
                    }
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
