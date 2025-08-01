import 'package:crypto_tracker/core/common/presentation/widgets/customButtons/custom_elevated_buttons.dart';
import 'package:crypto_tracker/core/config/assets.dart';
import 'package:crypto_tracker/core/config/text_styles.dart';
import 'package:crypto_tracker/core/network/error/failure.dart';
import 'package:crypto_tracker/features/auth/presentation/pages/login_sheet.dart';
import 'package:crypto_tracker/features/crypto/presentation/pages/crypto_wishlist/bloc/crypto_wishlist_bloc.dart';
import 'package:crypto_tracker/features/crypto/presentation/widgets/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

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
          if (state.cryptos.isEmpty) {
            return Center(
              child: Stack(
                alignment: Alignment.bottomCenter,

                children: [
                  LottieBuilder.asset(
                    AppAssets.emptyWishlist,
                    height: 300.r,
                    width: 300.r,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    'no items in wish list',
                    style: CustomTextStyle.styleW600S18White,
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: state.cryptos.length,
            itemBuilder: (context, index) {
              final item = state.cryptos[index];
              return ListTile(title: CryptoCard(crypto: item));
            },
          );
        } else if (state is GetCryptoWishListError) {
          if (state.error is AuthFailure) {
            return UnAuthorizedWishlist();
          } else {
            return Center(child: Text(state.error.toString()));
          }
        } else if (state is UnAuthorized) {
          return UnAuthorizedWishlist();
        }

        return const SizedBox();
      },
    );
  }
}

class UnAuthorizedWishlist extends StatelessWidget {
  const UnAuthorizedWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20.h,
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            child: Lottie.asset(
              AppAssets.login,
              height: 100.r,
              width: 100.r,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            'to access this feature you need to login',
            style: CustomTextStyle.styleW600S18White,
          ),
          CustomMainButton(
            margin: EdgeInsets.symmetric(horizontal: 100.w),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return LoginSheet();
                },
              );
            },
            text: 'Login',
          ),
        ],
      ),
    );
  }
}
