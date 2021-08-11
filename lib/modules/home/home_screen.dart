import 'package:flutter/material.dart';
import 'package:payflow/modules/extract/extract_screen.dart';
import 'package:payflow/modules/my_boletos/my_boletos_screen.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    var names = '${widget.user.name}'.split(' ');
    String firstName = names[0];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(142),
        child: Container(
            height: 142,
            color: AppColors.primary,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.primaryGradient,
                    AppColors.primary,
                  ],
                  center: Alignment(0, 1.6),
                  radius: 0.8,
                ),
              ),
              child: Center(
                child: ListTile(
                  title: Text.rich(
                    TextSpan(
                        text: 'Olá, ',
                        style: AppTextStyles.titleRegular,
                        children: [
                          TextSpan(
                              text: '${firstName}',
                              style: AppTextStyles.titleBoldBackground)
                        ]),
                    style: AppTextStyles.titleRegular,
                  ),
                  subtitle: Text('Mantenha as suas contas em dia',
                      style: AppTextStyles.captionShape),
                  trailing: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(widget.user.photoURL!))),
                  ),
                ),
              ),
            )),
      ),
      body: [
        MyBoletosScreen(key: UniqueKey()),
        ExtractScreen(key: UniqueKey()),
      ][controller.currentScreen],
      bottomNavigationBar: Container(
          height: 90,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                onPressed: () {
                  controller.setScreen(0);
                  setState(() {});
                },
                icon: Icon(
                  Icons.home,
                  color: controller.currentScreen == 0
                      ? AppColors.primary
                      : AppColors.body,
                )),
            GestureDetector(
                onTap: () async {
                  await Navigator.pushNamed(context, '/barcode_scanner');
                  setState(() {});
                },
                child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(Icons.add_box_outlined,
                        color: AppColors.background))),
            IconButton(
                onPressed: () {
                  controller.setScreen(1);
                  setState(() {});
                },
                icon: Icon(Icons.description_outlined,
                    color: controller.currentScreen == 1
                        ? AppColors.primary
                        : AppColors.body)),
          ])),
    );
  }
}
