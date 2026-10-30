import 'package:flutter/material.dart';
import 'screens/catalog_feed_screen.dart';

void main() => runApp(const NarxozStoreApp());

class NarxozStoreApp extends StatelessWidget {
  const NarxozStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Catalog • LW8',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF02569B)),
        scaffoldBackgroundColor: const Color(0xFFF6F8FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF102A43),
          centerTitle: false,
        ),
      ),
      home: const CatalogFeedScreen(),
    );
  }
}
