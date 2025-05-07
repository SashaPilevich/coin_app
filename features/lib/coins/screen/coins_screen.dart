import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/coins_bloc.dart';
import 'coins_form.dart';

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoinsBloc>(
      create: (_) => CoinsBloc(
        fetchCoinsUseCase: appLocator<FetchCoinsUseCase>(),
      ),
      child: const CoinsForm(),
    );
  }
}
