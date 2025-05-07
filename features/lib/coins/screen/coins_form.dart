import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/coins_bloc.dart';
import '../widgets/coin_item.dart';

class CoinsForm extends StatelessWidget {
  const CoinsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final CoinsBloc bloc = context.read<CoinsBloc>();
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<CoinsBloc, CoinsState>(
          builder: (BuildContext context, CoinsState state) {
            if (state.isError) {
              return ErrorContent(
                onTryAgain: () {
                  bloc.add(LoadCoinsEvent());
                },
              );
            }
            return LazyLoadScrollView(
              isLoading: state.isLoading,
              onEndOfPage: () {
                if (!state.isDownloading) {
                  bloc.add(DownloadCoinsEvent());
                }
              },
              child: RefreshIndicator(
                color: AppColors.of(context).appLoaderColor,
                backgroundColor: AppColors.white,
                onRefresh: () async {
                  bloc.add(LoadCoinsEvent());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.padding20.w),
                  child: SingleChildScrollView(
                    child: state.isLoading
                        ? const ShimmerColumn(count: AppDimens.count15)
                        : Column(
                            children: <Widget>[
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.coins.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final CoinModel coin = state.coins[index];
                                  final Color color = ColorGenerator.generateColor(index);
                                  return CoinItem(
                                    coin: coin,
                                    backgroundColor: color,
                                  );
                                },
                              ),
                              DownloadingItem(isVisible: state.isDownloading)
                            ],
                          ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
