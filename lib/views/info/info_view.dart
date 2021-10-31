import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project/controllers/app_state_controller.dart';
import 'package:project/controllers/auth_controller.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/helpers/constants.dart';
import 'package:project/helpers/logs.dart';
import 'package:project/models/user.dart';
import 'package:project/views/design/design_view.dart';
import 'package:provider/provider.dart';

class InfoView extends StatefulWidget {
  const InfoView({Key? key}) : super(key: key);

  @override
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  late User user;

  String? name, email, phone, id;
  int? result;

  Map<String, dynamic> userData = {};

  bool loading = false;

  AuthController authController = AuthController();

  @override
  void initState() {
    super.initState();
    setState(() {
      id = state(context: context).generateRandomString(10);
      userData['id'] = id;
    });

    printLog(id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateController>(builder: (context, appState, child) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
          title: CustomText(
            text: 'Info',
            color: Colors.white,
            fontSize: SIZE(context: context).width * .065,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          height: SIZE(context: context).height,
          width: SIZE(context: context).width,
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: SIZE(context: context).height * .06),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Name cannot be empty";
                          return null;
                        },
                        cursorColor: Theme.of(context).primaryColor,
                        onChanged: (value) {
                          setState(() {
                            name = value;
                            userData['name'] = name;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 3.5)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            hintText: 'Name',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Name',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Email cannot be empty";
                          if (!state(context: context).isEmailValid(value))
                            return "Use a valid email address!";
                          return null;
                        },
                        cursorColor: Theme.of(context).primaryColor,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                            userData['email'] = email;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 3.5)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        maxLength: 10,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Phone cannot be empty";
                          return null;
                        },
                        cursorColor: Theme.of(context).primaryColor,
                        onChanged: (value) {
                          setState(() {
                            phone = value;
                            userData['phone'] = phone;
                          });
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 3.5)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            hintText: 'Phone',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Phone',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: !loading
                          ? Row(
                              children: [
                                Expanded(
                                    child: ElevatedButton(
                                        child: CustomText(
                                            text: 'Add', color: Colors.white),
                                        onPressed: () async {
                                          FocusScope.of(
                                                  _scaffoldKey.currentContext!)
                                              .unfocus();
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();

                                            setState(() {
                                              loading = true;
                                              user = User(
                                                id: id,
                                                name: name!,
                                                phone: phone!,
                                                email: email!,
                                                dateAdded: DateFormat(
                                                        'MM/dd/yyyy H:i:s')
                                                    .format(DateTime.now())
                                                    .toString(),
                                              );
                                              appState.addUser(user);

                                              authController.saveData(
                                                  key: AppConstants.USER_KEY,
                                                  value: json
                                                      .encode(appState.users)
                                                      .toString());
                                            });

                                            printLog(json
                                                .encode(appState.users)
                                                .toString());

                                            printLog(userData);

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor: Theme.of(context)
                                                  .primaryColor,
                                              content: CustomText(
                                                  text: 'Saved successfully',
                                                  color: Colors.white),
                                              action: SnackBarAction(
                                                  label: 'OK',
                                                  textColor: Colors.white,
                                                  onPressed: () {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                  }),
                                            ));

                                            await Future.delayed(
                                                Duration(milliseconds: 1300));
                                            setState(() {
                                              loading = false;
                                            });

                                            Navigator.pushReplacement(
                                                context,
                                                PageTransition(
                                                    child: DesignView(),
                                                    type: PageTransitionType
                                                        .rightToLeft));

                                            printLog(state(context: context)
                                                .users
                                                .toString());
                                          }
                                        }))
                              ],
                            )
                          : SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                                backgroundColor: Colors.black,
                                strokeWidth: 3.5,
                              ),
                            ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
