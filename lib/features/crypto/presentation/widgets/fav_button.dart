import 'package:crypto_tracker/features/crypto/domain/entities/crypto_entity.dart';
import 'package:crypto_tracker/features/crypto/presentation/pages/crypto_wishlist/bloc/crypto_wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.item});
  final CryptoEntity item;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoWishlistBloc, CryptoWishlistState>(
      builder: (context, state) {
        return IconButton(
          onPressed:
              () => context.read<CryptoWishlistBloc>().add(
                EditWishlist(cryptoEntity: item),
              ),
          icon:
              context.read<CryptoWishlistBloc>().isInWishlist(item.id)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_outline),
        );
      },
    );
  }
}
