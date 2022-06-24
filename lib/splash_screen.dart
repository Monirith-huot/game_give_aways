import 'package:flutter/material.dart';
import 'package:game_give_aways/home_page.dart';
import 'package:game_give_aways/logic/discount_game_logic.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () async {
      await context.read<DiscountGameLogic>().readData();
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: ((context) => HomePage()),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Color.fromRGBO(36, 45, 60, 1),
      child: Center(
        child: Image.asset(
          'lib/image/5f7a0664956943.5ae3403ff2cbf.png',
        ),
      ),
    );
  }
}
