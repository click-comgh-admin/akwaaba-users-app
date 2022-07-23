import 'package:flutter/material.dart';

class AltProfileButtomWidget extends StatelessWidget {
  const AltProfileButtomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        leading: const Text("My Account"),
        trailing: Icon(
          color: Theme.of(context).iconTheme.color,
          Icons.logout_sharp,
        ),
      ),
    );
  }
}
