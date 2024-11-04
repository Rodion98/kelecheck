import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ud_mobile_app/core/constants/enums.dart';
import 'package:ud_mobile_app/features/main/data/rental_variations_local_db.dart';
import 'package:ud_mobile_app/features/main/presentation/widgets/home_appbar.dart';
import 'package:ud_mobile_app/features/main/presentation/widgets/home_service_card.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HomeAppBar(),
          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 30,),
            child: HomeServiceCardWidget(
              widgetToReplace: Container(),
              availableCount: 1,
              overallCount: 1,
              rentalOption: rentalTypes(context)[1],
              status: MainStatus.loaded,
            ),
          )
        ],
      ),
    );
  }
}
