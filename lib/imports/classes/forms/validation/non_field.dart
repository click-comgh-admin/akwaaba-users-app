import 'dart:convert';

NonFieldValidationForm nonFieldValidationFormFromJson(String str) =>
    NonFieldValidationForm.fromJson(json.decode(str));

String nonFieldValidationFormToJson(NonFieldValidationForm data) =>
    json.encode(data.toJson());

class NonFieldValidationForm {
  String messages;

  NonFieldValidationForm({
    required this.messages,
  });

  factory NonFieldValidationForm.fromJson(Map<String, dynamic> json) {
    return NonFieldValidationForm(
      messages: json["messages"],
    );
  }

  Map<String, dynamic> toJson() => {
        "messages": messages,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
