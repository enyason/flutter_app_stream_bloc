import 'package:flutter/material.dart';
import 'bloc.dart';

class MyInheritedWidget extends InheritedWidget {
  Bloc bloc = Bloc();

  MyInheritedWidget({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MyInheritedWidget)
            as MyInheritedWidget)
        .bloc;
  }
}
