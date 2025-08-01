import 'package:crypto_tracker/core/common/presentation/widgets/networkImage/network_image.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/crypto_entity.dart';
import 'package:crypto_tracker/features/crypto/presentation/widgets/fav_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoCard extends StatelessWidget {
  final CryptoEntity crypto;

  const CryptoCard({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CustomImageWidget(imagePath: crypto.image ?? '', width: 50.w),
        title: Text(
          crypto.name ?? 'N/A',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(crypto.symbol?.toUpperCase() ?? ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  crypto.currentPrice != null
                      ? "\$${crypto.currentPrice!.toStringAsFixed(2)}"
                      : "--",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(' . '),
                Text(
                  crypto.priceChangePercentage24h != null
                      ? "${crypto.priceChangePercentage24h!.toStringAsFixed(2)}%"
                      : "--",
                  style: TextStyle(
                    color:
                        (crypto.priceChangePercentage24h ?? 0) >= 0
                            ? Colors.green
                            : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: FavButton(item: crypto),

        // Fav button as a separate widget
      ),
    );
  }
}
