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
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.padding20.w),
                  itemCount: state.isLoading ? AppDimens.count15 : state.coins.length,
                  itemBuilder: (BuildContext context, int index) {
                    final bool isDownloading =
                        index == state.coins.length - 1 && state.isDownloading;
                    if (state.isLoading) {
                      return const ShimmerWidget();
                    }
                    if (isDownloading) {
                      return const DownloadingItem(isVisible: true);
                    }
                    final CoinModel coin = state.coins[index];
                    final Color color = state.colors[index] ?? AppColors.violet;
                    return CoinItem(
                      key: ValueKey<String>(coin.id),
                      coin: coin,
                      backgroundColor: color,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
