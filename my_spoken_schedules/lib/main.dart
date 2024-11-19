import 'package:flutter/cupertino.dart';
// import 'package:mvvm_example_with_provider/view/list_pictures_view.dart';
// import 'package:mvvm_example_with_provider/view_model/list_pictures_view_model.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        debugShowCheckedModeBanner: true,
        title: 'Random Photo Gallery',
        theme: const CupertinoThemeData(),
        home: ChangeNotifierProvider(
          create: (BuildContext context) {},
          child: const Text(
            "hello world",
            style: TextStyle(
              color: CupertinoColors.activeBlue,
            ),
          ),
        ));
  }
}
