import 'package:flutter/material.dart';
import 'package:project/elements/custom_input.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/helpers/logs.dart';

class InfoView extends StatefulWidget {
  const InfoView({Key? key}) : super(key: key);
  static const String routeName = 'info';

  @override
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: state(context: context).currentTitle),
      ),
      body: SizedBox(
        height: SIZE(context: context).height,
        width: SIZE(context: context).width,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomInput(
                    controller: nameController,
                    onChanged: (value) {},
                    label: 'Name',
                    hintText: 'Name',
                  ),
                  CustomInput(
                    controller: nameController,
                    onChanged: (value) {},
                    label: 'Email',
                    type: TextInputType.emailAddress,
                    validator: (input) {},
                    hintText: 'Email',
                  ),
                  CustomInput(
                    validator: (input) {},
                    controller: nameController,
                    type: TextInputType.number,
                    onChanged: (value) {},
                    label: 'Phone',
                    hintText: 'Phone',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                child: CustomText(text: 'Add'),
                                onPressed: () {}))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
