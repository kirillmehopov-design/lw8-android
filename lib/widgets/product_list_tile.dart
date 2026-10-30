import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product, required this.onDismissed});
  final Product product;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) => Dismissible(
    key: ValueKey(product.id),
    direction: DismissDirection.endToStart,
    background: Container(
      color: Colors.red, alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 24),
      child: const Icon(Icons.delete, color: Colors.white, size: 28),
    ),
    onDismissed: (_) => onDismissed(),
    child: ColoredBox(
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: product.accentColor.withAlpha(25),
          child: Icon(product.categoryIcon, color: product.accentColor),
        ),
        title: Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
        subtitle: Column(mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 4),
            Text(product.category, maxLines: 1, overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 11, color: product.accentColor)),
            const SizedBox(height: 4),
            Row(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.star_rounded, color: Color(0xFFE7A520), size: 16),
              const SizedBox(width: 3),
              Text(product.rating.toStringAsFixed(1), style: const TextStyle(fontSize: 12)),
            ]),
          ]),
        trailing: Text('\$${product.price.toStringAsFixed(0)}',
          style: const TextStyle(color: Color(0xFF02569B),
            fontWeight: FontWeight.w800, fontSize: 14)),
      ),
    ),
  );
}
