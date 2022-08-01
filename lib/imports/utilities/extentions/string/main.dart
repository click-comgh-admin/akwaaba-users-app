extension StringExtension on String {
  String upperCaseFirstCharacter(String? string) {
    string ??= this;
    return "${string[0].toUpperCase()}${string.substring(1)}";
  }

  String capitalize() {
    String text = this;
    return text.split(" ").map(upperCaseFirstCharacter).join(' ');
  }
}
