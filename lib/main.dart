import 'package:admin_clinical/constants/app_colors.dart';
import 'package:admin_clinical/routes/name_route.dart';
import 'package:admin_clinical/routes/page_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'constants/api_link.dart';

IO.Socket socket = IO.io(
  ApiLink.uri,
  IO.OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
      .build(),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  socket.onConnect((_) => print('connected'));
  socket.on('verify', (jsonData) {
    print(jsonData);
    Get.back();
  });
  socket.onDisconnect((_) => print('disconnect'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clinic Management',
      defaultTransition: Transition.fadeIn,
      theme: ThemeData(
        fontFamily: "Roboto",
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: AppColors.headline1TextColor,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.greyBackgroundCOlor,
        primarySwatch: Colors.lightBlue,
      ),
      getPages: PagesRoute.pages,
      initialRoute: PageName.splashScreen,
    );
  }
}
