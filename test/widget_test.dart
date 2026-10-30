import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lw8_smart_catalog/main.dart';
import 'package:lw8_smart_catalog/screens/catalog_feed_screen.dart';

void main() {
  testWidgets('Initial list has 36 products', (tester) async {
    await tester.pumpWidget(const NarxozStoreApp());
    expect(find.text('36 products'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Grid view has two columns and 0.72 ratio', (tester) async {
    await tester.pumpWidget(const NarxozStoreApp());
    await tester.tap(find.text('Grid Catalog').last);
    await tester.pumpAndSettle();
    final grid = tester.widget<GridView>(find.byType(GridView));
    final delegate = grid.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
    expect(delegate.crossAxisCount, 2);
    expect(delegate.childAspectRatio, 0.72);
  });

  testWidgets('Empty state can reset the catalog', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CatalogFeedScreen(initialProducts: []),
    ));
    expect(find.text('Catalog is Empty'), findsOneWidget);
    await tester.tap(find.text('Reset Catalog'));
    await tester.pumpAndSettle();
    expect(find.text('36 products'), findsOneWidget);
  });
}
