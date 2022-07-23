import 'package:akwaaba_user_app/imports/classes/forms/validation/field.dart';
import 'package:akwaaba_user_app/imports/classes/forms/validation/non_field.dart';
import 'package:flutter/material.dart';

class FormValidationManager with ChangeNotifier {
  Map<String, FieldValidationForm> _listFields = {};
  Map<String, FieldValidationForm> _fieldErrors = {};
  List<NonFieldValidationForm> _nonFieldErrors = [];

  Map<String, FieldValidationForm> get listFields => _listFields;
  Map<String, FieldValidationForm> get fieldErrors => _fieldErrors;
  List<NonFieldValidationForm> get nonFieldErrors => _nonFieldErrors;

  setListFields(Map<String, FieldValidationForm> listFields) {
    _listFields = listFields;
  }

  setFieldErrors(Map<String, FieldValidationForm> fieldErrors) {
    _fieldErrors = fieldErrors;
  }

  setNonFieldErrors(List<NonFieldValidationForm> nonFieldErrors) {
    _nonFieldErrors = nonFieldErrors;
  }

  validationErrors(Object errors) {
    // print({"errors": errors, "Type()": errors.runtimeType});
    // print({"_listFields": _listFields});
    errors = errors as Map;
    for (final String name in errors.keys) {
      final error = errors[name];
      // print({"error": error});

      inListField(name, error);
    }

    notifyListeners();
  }

  List<String> _getMessages(dynamic value) {
    List<String> messages = [];

    if (value is String) {
      messages.add(value);
    }
    if (value is List) {
      for (final String val in value) {
        messages.add(val);
      }
    }
    return messages;
  }

  inListField(String key, dynamic value) {
    // Map<String, FieldValidationForm> fieldErrors = {};
    List<NonFieldValidationForm> nonFieldErrors = [];
    List<String> nonFieldErrorMessages = [];

    if (_listFields.containsKey(key)) {
      List<String> messages = _getMessages(value);
      FieldValidationForm? fieldData = _listFields[key];
      final fieldErrorMsg = FieldValidationForm(
        identify: fieldData!.identify,
        messages: messages,
        controller: fieldData.controller,
        hasError: true,
      );
      // fieldErrors[key] = fieldErrorMsg;
      _fieldErrors[key] = fieldErrorMsg;
    } else {
      List<String> messages = _getMessages(value);
      for (var message in messages) {
        if (!nonFieldErrorMessages.contains(message)) {
          nonFieldErrorMessages.add(message);
        }
      }
    }

    // setFieldErrors(fieldErrors);
    // _fieldErrors[key] = fieldErrors;

    nonFieldErrors = nonFieldErrorMessages
        .map((message) => NonFieldValidationForm(messages: message))
        .toList();
    setNonFieldErrors(nonFieldErrors);
  }
}
