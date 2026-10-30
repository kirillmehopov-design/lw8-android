import 'package:flutter/material.dart';

import '../models/catalog_data.dart';
import '../models/product.dart';
import '../widgets/product_grid_card.dart';
import '../widgets/product_list_tile.dart';

class CatalogFeedScreen extends StatefulWidget {
  const CatalogFeedScreen({super.key, this.initialProducts});
  final List<Product>? initialProducts;

  @override
  State<CatalogFeedScreen> createState() => _CatalogFeedScreenState();
}

class _CatalogFeedScreenState extends State<CatalogFeedScreen> {
  late final List<Product> _products;
  int _selectedView = 0;
  int _newProductSequence = 1;
  bool _refreshing = false;

  @override
  void initState() {
    super.initState();
    _products = List<Product>.of(widget.initialProducts ?? buildInitialCatalog());
  }

  Future<void> _refreshCatalog() async {
    if (_refreshing) return;
    _refreshing = true;
    try {
      await Future.delayed(const Duration(milliseconds: 1500));
      if (!mounted) return;
      final sample = buildInitialCatalog()[(_newProductSequence - 1) % 36];
      final freshProduct = sample.copyWith(
        id: 'fresh-${_newProductSequence}',
        title: 'New Arrival #\${_newProductSequence}',
        badge: 'NEW',
      );
      setState(() {
        _newProductSequence++;
        _products.insert(0, freshProduct);
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Catalog refreshed: new item added to the top'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ));
    } finally {
      _refreshing = false;
    }
  }

  void _deleteProduct(Product product) {
    final originalIndex = _products.indexWhere((p) => p.id == product.id);
    if (originalIndex < 0) return;
    setState(() => _products.removeAt(originalIndex));
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
      content: Text('Deleted: ${product.title}'),
      action: SnackBarAction(label: 'UNDO', onPressed: () {
        if (!mounted || _products.any((p) => p.id == product.id)) return;
        setState(() => _products.insert(
          originalIndex <= _products.length ? originalIndex : _products.length,
          product,
        ));
      }),
    ));
  }

  void _resetCatalog() {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    setState(() {
      _products..clear()..addAll(buildInitialCatalog());
    });
  }

  Widget _buildListView() => ListView.separated(
    key: const PageStorageKey<String>('list-feed'),
    physics: const AlwaysScrollableScrollPhysics(),
    padding: const EdgeInsets.symmetric(vertical: 8),
    itemCount: _products.length,
    separatorBuilder: (context, index) => const Divider(
      height: 1, indent: 78, endIndent: 16, thickness: 0.6),
    itemBuilder: (context, index) {
      final product = _products[index];
      return ProductListTile(product: product,
        onDismissed: () => _deleteProduct(product));
    },
  );

  Widget _buildGridView() => GridView.builder(
    key: const PageStorageKey<String>('grid-catalog'),
    physics: const AlwaysScrollableScrollPhysics(),
    padding: const EdgeInsets.all(12),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.72,
    ),
    itemCount: _products.length,
    itemBuilder: (context, index) {
      final product = _products[index];
      return ProductGridCard(product: product,
        onDelete: () => _deleteProduct(product));
    },
  );

  Widget _buildEmptyState() => LayoutBuilder(
    builder: (context, constraints) => ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [SizedBox(height: constraints.maxHeight,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.inventory_2_outlined, size: 70,
              color: Colors.blueGrey),
            const SizedBox(height: 12),
            const Text('Catalog is Empty',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            const Text('All products were removed.'),
            const SizedBox(height: 20),
            FilledButton.icon(onPressed: _resetCatalog,
              icon: const Icon(Icons.restart_alt),
              label: const Text('Reset Catalog')),
          ]))],
    ),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Smart Catalog • LW8',
        style: TextStyle(fontWeight: FontWeight.bold)),
      actions: [
        IconButton(tooltip: 'Refresh Catalog', onPressed: _refreshCatalog,
          icon: const Icon(Icons.refresh)),
      ],
    ),
    body: Column(children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${_products.length} products',
              style: const TextStyle(fontWeight: FontWeight.w700)),
            Text(_selectedView == 0 ? 'List Feed' : 'Grid Catalog'),
          ]),
      ),
      Expanded(child: RefreshIndicator(
        onRefresh: _refreshCatalog,
        child: _products.isEmpty ? _buildEmptyState()
          : _selectedView == 0 ? _buildListView() : _buildGridView(),
      )),
    ]),
    bottomNavigationBar: NavigationBar(
      selectedIndex: _selectedView,
      onDestinationSelected: (index) => setState(() => _selectedView = index),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.view_list_outlined),
          selectedIcon: Icon(Icons.view_list), label: 'List Feed'),
        NavigationDestination(icon: Icon(Icons.grid_view_outlined),
          selectedIcon: Icon(Icons.grid_view), label: 'Grid Catalog'),
      ],
    ),
  );
}
