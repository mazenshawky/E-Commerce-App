import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  di.initBlocObserver();
  runApp(const EcommerceApp());
}
