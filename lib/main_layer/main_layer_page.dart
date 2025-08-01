import 'package:crypto_tracker/app/di.dart';
import 'package:crypto_tracker/features/crypto/presentation/bloc/crypto_bloc.dart';
import 'package:crypto_tracker/features/crypto/presentation/pages/crypto_list_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayerPage extends StatelessWidget {
  const MainLayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<CryptoBloc>(
        create: (context) => getIt<CryptoBloc>()..add(GetCryptoList()),
        child: CryptoListTab(),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
