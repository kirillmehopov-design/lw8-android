import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductGridCard extends StatelessWidget {
  const ProductGridCard({super.key, required this.product, required this.onDelete});
  final Product product;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) => Card(
    margin: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    child: Padding(padding: const EdgeInsets.all(8), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24, child: Row(children: [
          Flexible(child: Text(product.badge, maxLines: 1,
            style: TextStyle(color: product.accentColor,
              fontWeight: FontWeight.bold, fontSize: 11))),
          const Spacer(),
          SizedBox(width: 25, height: 24, child: IconButton(
            tooltip: 'Delete ${product.title}', onPressed: onDelete,
            icon: const Icon(Icons.close, size: 17), padding: EdgeInsets.zero,
            constraints: const BoxConstraints())),
        ])),
        const SizedBox(height: 4),
        Expanded(child: Center(child: Icon(product.categoryIcon,
          size: 56, color: product.accentColor))),
        const SizedBox(height: 4),
        Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 11, height: 1.15,
            fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
        SizedBox(height: 20, child: Row(children: [
          const Icon(Icons.star_rounded, size: 14, color: Color(0xFFE7A520)),
          Text(product.rating.toStringAsFixed(1),
            style: const TextStyle(fontSize: 11)),
          const SizedBox(width: 4),
          Expanded(child: Text('\$${product.price.toStringAsFixed(0)}',
            maxLines: 1, overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 13,
              fontWeight: FontWeight.w800, color: Color(0xFF02569B)))),
        ])),
      ],
    )),
  );
}
