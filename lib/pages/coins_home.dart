import 'dart:convert';
import 'package:coin_desk/constants/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoinHomePage extends StatefulWidget {
  const CoinHomePage({super.key});

  @override
  State<CoinHomePage> createState() => _CoinHomePageState();
}

class _CoinHomePageState extends State<CoinHomePage> {
  Map<String, dynamic>? data;

  Future fetchData() async {
    try {
      final response = await http.get(Uri.parse(appUrl));
      if (response.statusCode == 200) {
        data = json.decode(response.body);
      }
    } catch (e) {
      throw Exception('Error');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Coins'),
      ),
      body: data == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${data!['time']['updated']}'),
                Text('${data!['chartName']}'),
                Text('${data!['disclaimer']}'),
                Text('${data!['bpi']['USD']['rate']}'),
                Text('${data!['bpi']['GBP']['rate']}'),
                Text('${data!['bpi']['EUR']['rate']}'),
              ],
            ),
    );
  }
}
