import 'dart:async';

import 'package:crypto_tracker/app/di.dart';
import 'package:crypto_tracker/core/common/presentation/widgets/custom_text_form_field.dart';
import 'package:crypto_tracker/core/common/presentation/widgets/networkImage/network_image.dart';
import 'package:crypto_tracker/core/common/presentation/widgets/networkWidgets/custom_empty_list.dart';
import 'package:crypto_tracker/core/common/presentation/widgets/networkWidgets/error_widget.dart';
import 'package:crypto_tracker/core/config/colors.dart';
import 'package:crypto_tracker/core/config/text_styles.dart';
import 'package:crypto_tracker/features/crypto/data/models/search_response.dart';
import 'package:crypto_tracker/features/crypto/presentation/pages/search/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  late SearchBloc searchBloc;
  Timer? _debounce;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    searchBloc = getIt<SearchBloc>();
    _tabController = TabController(length: 4, vsync: this);
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final query = searchController.text.trim();
      searchBloc.add(OnSearchEvent(query));
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: searchBloc,
      child: Scaffold(
        appBar: AppBar(
          title: CustomTextFormField(
            controller: searchController,
            prefix: Padding(
              padding: EdgeInsets.all(10.r),
              child: Icon(Icons.search, size: 25.r),
            ),
            hintText: 'Search...', //TODO:localization
          ),
          bottom: TabBar(
            controller: _tabController,
            labelColor: AppColors.accentColor,
            labelStyle: CustomTextStyle.styleW700S14White,
            unselectedLabelStyle: CustomTextStyle.styleW600S14White,
            tabs: const [
              Tab(text: 'Coins'), //TODO:localization
              Tab(text: 'Exchanges'), //TODO:localization
              Tab(text: 'Categories'),
              Tab(text: 'NFTs'),
            ],
            isScrollable: true,
          ),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              } else if (state is SearchFailure) {
                return CustomErrorWidget(
                  error: state.failure,
                  refresh: () {
                    searchBloc.add(OnSearchEvent(searchController.text));
                  },
                );
              } else if (state is SearchSuccess) {
                return Padding(
                  padding: EdgeInsets.all(10.r),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Coins Tab
                      CoinsTab(coins: state.searchResponse.coins ?? []),
                      // Exchanges Tab
                      ExchangesTab(
                        exchanges: state.searchResponse.exchanges ?? [],
                      ),

                      // Categories Tab
                      CategoriesTab(
                        categories: state.searchResponse.categories ?? [],
                      ),
                      // NFTs Tab
                      NftsTab(nfts: state.searchResponse.nfts ?? []),
                    ],
                  ),
                );
              }

              return const Center(
                child: Text('Start typing to search'),
              ); //TODO:localization
            },
          ),
        ),
      ),
    );
  }
}

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key, required this.categories});
  final List<Categories> categories;
  @override
  Widget build(BuildContext context) {
    return categories.isEmpty
        ? CustomEmptyList(title: 'No categories found') //TODO:localization
        : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final item = categories[index];
            return Card.outlined(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(5.r),
                  child: Text(item.name ?? '', textAlign: TextAlign.center),
                ),
              ),
            );
          },
        );
  }
}

class CoinsTab extends StatelessWidget {
  const CoinsTab({super.key, required this.coins});
  final List<Coins> coins;
  @override
  Widget build(BuildContext context) {
    return coins.isEmpty
        ? CustomEmptyList(title: 'No Coins found') //TODO:localization
        : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: coins.length,
          itemBuilder: (context, index) {
            final item = coins[index];
            return Card.outlined(
              child: Column(
                spacing: 20.h,
                children: [
                  Expanded(
                    child: CustomImageWidget(imagePath: item.large ?? ''),
                  ),
                  Text(item.name ?? ''),
                ],
              ),
            );
          },
        );
  }
}

class ExchangesTab extends StatelessWidget {
  const ExchangesTab({super.key, required this.exchanges});
  final List<Exchanges> exchanges;
  @override
  Widget build(BuildContext context) {
    return exchanges.isEmpty
        ? CustomEmptyList(title: 'No Exchanges found') //TODO:localization
        : ListView.builder(
          itemCount: exchanges.length,
          itemBuilder: (context, index) {
            final item = exchanges[index];

            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: CustomImageWidget(
                    imagePath: item.large ?? '',
                    width: 100.w,
                  ),
                  title: Text(item.name ?? ''),
                ),
              ),
            );
          },
        );
  }
}

class NftsTab extends StatelessWidget {
  const NftsTab({super.key, required this.nfts});
  final List<Nfts> nfts;
  @override
  Widget build(BuildContext context) {
    return nfts.isEmpty
        ? CustomEmptyList(title: 'No NFTs found') //TODO:localization
        : ListView.builder(
          itemCount: nfts.length,
          itemBuilder: (context, index) {
            final item = nfts[index];

            return ListTile(
              leading: CustomImageWidget(
                imagePath: item.thumb ?? '',
                width: 50.w,
              ),
              title: Text(item.name ?? ''),
            );
          },
        );
  }
}

// Widget _buildEmptyState(String message) {
//   return Center(
//     child: Column(
//       spacing: 10.h,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Lottie.asset(
//           AppAssets.emptyBox,
//           height: 100.r,
//           width: 100.r,
//           fit: BoxFit.fill,
//         ),
//         Text(message, style: TextStyle(fontSize: 16.sp)),
//       ],
//     ),
//   );
// }
