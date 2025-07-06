import 'package:flutter/material.dart';

class NftMarketplacePage extends StatelessWidget {
  const NftMarketplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFT Marketplace'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('NFT Marketplace Page'),
      ),
    );
  }
}

