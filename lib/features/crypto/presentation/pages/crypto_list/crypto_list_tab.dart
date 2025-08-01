import 'package:crypto_tracker/features/crypto/presentation/pages/crypto_list/bloc/crypto_bloc.dart';
import 'package:crypto_tracker/features/crypto/presentation/pages/crypto_wishlist/bloc/crypto_wishlist_bloc.dart';
import 'package:crypto_tracker/features/crypto/presentation/widgets/fav_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetCryptoListSuccess) {
          return Column(
            children: [
              if (state.errorMessage != null)
                Container(
                  height: 50,
                  decoration: const BoxDecoration(color: Colors.red),
                  child: Text(state.errorMessage!),
                ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollInfo) {
                    if (scrollInfo.metrics.pixels >
                            scrollInfo.metrics.maxScrollExtent * .9 &&
                        !state.isLoadingMore) {
                      context.read<CryptoBloc>().add(LoadNextPage());
                    }
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: state.cryptos.length,
                    itemBuilder: (context, index) {
                      final item = state.cryptos[index];
                      return ListTile(
                        title: Text(item.name ?? ''),
                        trailing: IconButton(
                          onPressed:
                              () => context.read<CryptoWishlistBloc>().add(
                                EditWishlist(cryptoEntity: item),
                              ),
                          icon: FavButton(item: item),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        } else if (state is GetCryptoListError) {
          return Center(child: Text(state.failure.toString()));
        }
        return const SizedBox();
      },
    );
  }
}
