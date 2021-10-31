import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/controllers/app_state_controller.dart';
import 'package:project/elements/custom_text.dart';
import 'package:project/elements/user_card.dart';

import 'package:project/helpers/logs.dart';
import 'package:project/models/user.dart';
import 'package:provider/provider.dart';

class DesignView extends StatefulWidget {
  const DesignView({Key? key}) : super(key: key);

  @override
  _DesignViewState createState() => _DesignViewState();
}

class _DesignViewState extends State<DesignView> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateController>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
          title: CustomText(
            text: 'Design',
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
            children: [
              SizedBox(
                //height: SIZE(context: context).height * .045,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/lottie/cards.json',
                        fit: BoxFit.cover,
                        height: SIZE(context: context).height * .1,
                        width: SIZE(context: context).width),
                  ],
                ),
              ),
              SizedBox(height: SIZE(context: context).height * .32),
              SizedBox(
                height: SIZE(context: context).height * .6,
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(
                      appState.users.length,
                      (index) => UserCard(
                            user: appState.users[index],
                          )),
                ),
              ),
              // widget.user != null
              //     ?
              //     : const SizedBox.shrink()
            ],
          ),
        ));
  }
}
