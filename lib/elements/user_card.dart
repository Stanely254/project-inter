import 'package:flutter/material.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/helpers/logs.dart';
import 'package:project/models/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        type: MaterialType.card,
        elevation: 10,
        shadowColor: Colors.black38,
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
        child: SizedBox(
            width: SIZE(context: context).width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person,
                        color: Colors.grey,
                        size: SIZE(context: context).width * .056),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        CustomText(text: '${user!.name}'),
                        CustomText(text: '${user!.email}'),
                        // ignore: unnecessary_null_comparison
                        CustomText(text: '${user!.phone}')
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
