import 'package:crypto_tracker/core/common/presentation/widgets/networkWidgets/custom_empty_list.dart';
import 'package:crypto_tracker/core/common/presentation/widgets/networkWidgets/error_widget.dart';
import 'package:crypto_tracker/core/config/text_styles.dart';
import 'package:crypto_tracker/features/crypto/presentation/pages/crypto_list/bloc/crypto_bloc.dart';
import 'package:crypto_tracker/features/crypto/presentation/widgets/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoListTab extends StatefulWidget {
  const CryptoListTab({super.key});

  @override
  State<CryptoListTab> createState() => _CryptoListTabState();
}

class _CryptoListTabState extends State<CryptoListTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (context, state) {
        if (state is GetCryptoListLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        } else if (state is GetCryptoListSuccess) {
          return Column(
            children: [
              if (state.errorMessage != null)
                Container(
                  padding: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 22, 48, 94),
                  ),
                  child: InkWell(
                    onTap:
                        () => context.read<CryptoBloc>().add(GetCryptoList()),
                    child: Row(
                      spacing: 10.w,
                      children: [
                        Icon(Icons.refresh),
                        Text(state.errorMessage!),
                      ],
                    ),
                  ),
                ),

              state.cryptos.isEmpty
                  ? Expanded(child: CustomEmptyList(title: 'No items found'))
                  : Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollInfo) {
                        if (scrollInfo is ScrollEndNotification &&
                            scrollInfo.metrics.pixels >
                                scrollInfo.metrics.maxScrollExtent * .9 &&
                            !state.isLoadingMore) {
                          context.read<CryptoBloc>().add(LoadNextPage());
                        }
                        return false;
                      },
                      child: ListView.builder(
                        itemCount:
                            state.cryptos.length +
                            (state.isLoadingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == state.cryptos.length) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                child: Column(
                                  spacing: 5.h,
                                  children: [
                                    SizedBox(
                                      width: 20.r,
                                      height: 20.r,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.r,
                                      ),
                                    ),
                                    Text(
                                      'Loading more...', //TODO:localization
                                      style: CustomTextStyle.styleW500S12white,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          final item = state.cryptos[index];
                          return CryptoCard(crypto: item);
                        },
                      ),
                    ),
                  ),
            ],
          );
        } else if (state is GetCryptoListError) {
          return CustomErrorWidget(
            error: state.failure,
            refresh: () => context.read<CryptoBloc>().add(GetCryptoList()),
          );
        }
        return const SizedBox();
      },
    );
  }
}
