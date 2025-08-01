import 'package:crypto_tracker/features/crypto/presentation/pages/crypto_wishlist/bloc/crypto_wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoWishlistTab extends StatefulWidget {
  const CryptoWishlistTab({super.key});

  @override
  State<CryptoWishlistTab> createState() => _CryptoWishlistTabState();
}

class _CryptoWishlistTabState extends State<CryptoWishlistTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoWishlistBloc, CryptoWishlistState>(
      builder: (context, state) {
        if (state is GetCryptoWishListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetCryptoWishListSuccess) {
          return ListView.builder(
            itemCount: state.cryptos.length,
            itemBuilder: (context, index) {
              final item = state.cryptos[index];
              return ListTile(
                key: ValueKey(item.id),
                title: Text(item.name ?? ''),
              );
            },
          );
        } else if (state is GetCryptoWishListError) {
          return Center(child: Text(state.error.toString()));
        }
        return const SizedBox();
      },
    );
  }
}
