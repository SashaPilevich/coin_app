import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/main_bloc.dart';
import 'main_form.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (BuildContext context) => MainBloc(),
      child: const MainForm(),
    );
  }
}
