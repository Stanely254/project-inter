import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/helpers/app_db.dart';
import 'package:project/helpers/logs.dart';
import 'package:project/models/user.dart';

class DesignView extends StatefulWidget {
  const DesignView({Key? key}) : super(key: key);
  static const String routeName = 'design';

  @override
  _DesignViewState createState() => _DesignViewState();
}

class _DesignViewState extends State<DesignView> {
  final utility = AppDB.instance;
  List<User> users = [];
  bool has = true;

  void getAll() async {
    utility.getAllUsers().then((value) => {
          if (mounted)
            {
              setState(() {
                users = value;
              })
            }
          else
            {
              setState(() {
                has = false;
              })
            }
        });
  }

  @override
  void initState() {
    super.initState();
    getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(text: state(context: context).currentTitle),
          centerTitle: true,
        ),
        body: SizedBox(
          height: SIZE(context: context).height,
          width: SIZE(context: context).width,
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                //height: SIZE(context: context).height * .045,
                child: Row(
                  children: [
                    Lottie.asset('assets/lottie/cards.json'),
                    
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
