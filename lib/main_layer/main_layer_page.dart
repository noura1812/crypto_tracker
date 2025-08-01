import 'package:crypto_tracker/app/di.dart';
import 'package:crypto_tracker/features/crypto/presentation/pages/crypto_list/bloc/crypto_bloc.dart';
import 'package:crypto_tracker/features/crypto/presentation/pages/crypto_list/crypto_list_tab.dart';
import 'package:crypto_tracker/features/crypto/presentation/pages/crypto_wishlist/bloc/crypto_wishlist_bloc.dart';
import 'package:crypto_tracker/features/crypto/presentation/pages/crypto_wishlist_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayerPage extends StatefulWidget {
  const MainLayerPage({super.key});

  @override
  State<MainLayerPage> createState() => _MainLayerPageState();
}

class _MainLayerPageState extends State<MainLayerPage> {
  int _currentIndex = 0;
  List<Widget> tabs = [CryptoListTab(), CryptoWishlistTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CryptoBloc>(
            create: (context) => getIt<CryptoBloc>()..add(GetCryptoList()),
          ),
          BlocProvider(
            create:
                (context) =>
                    getIt<CryptoWishlistBloc>()..add(GetCryptoWishList()),
          ),
        ],
        child: tabs[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_bitcoin),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
        ],
      ),
    );
  }
}
