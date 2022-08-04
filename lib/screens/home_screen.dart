import 'dart:convert';

import 'package:dicoding_flutter_submission/components/grid_item.dart';
import 'package:dicoding_flutter_submission/components/loading.dart';
import 'package:dicoding_flutter_submission/constant.dart';
import 'package:dicoding_flutter_submission/models/animal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Animal> animals = [];
  bool isLoading = false;
  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getApi(context);
    });
  }

  @override
  void dispose() {
    darkNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = darkNotifier.value;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Zoo Animal'),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor)),
            onPressed: () {
              isDark = !isDark;
              darkNotifier.value = isDark;
            },
            child: Icon(isDark ? Icons.dark_mode : Icons.wb_sunny,
                semanticLabel: 'Toggle Dark Mode'),
          )
        ],
      ),
      body: SafeArea(
        child: isLoading
            ? const Loading()
            : GridView.builder(
                itemCount: animals.length,
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 800 ? 4 : 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.05,
                ),
                itemBuilder: (context, index) {
                  return GridItem(animal: animals[index]);
                }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getApi(context);
        },
        tooltip: 'Random Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  getApi(context) async {
    setState(() {
      isLoading = true;
    });
    try {
      var url =
          Uri.parse('https://zoo-animal-api.herokuapp.com/animals/rand/10');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        setState(() {
          animals =
              jsonResponse.map((model) => Animal.fromJson(model)).toList();
          isOffline = false;
        });
        debugPrint('Data diambil dari API.');
      } else {
        await loadJson(context);
      }
    } catch (e) {
      await loadJson(context);
    }
    setState(() {
      isLoading = false;
    });
  }

  loadJson(context) async {
    String data = await rootBundle.loadString('json/animal.json');
    Iterable jsonResponse = json.decode(data);
    setState(() {
      animals = jsonResponse.map((model) => Animal.fromJson(model)).toList();
      isOffline = true;
    });
    var snackBar = const SnackBar(
      content: Text('You are offline. Please check your internet connection.'),
      duration: Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    debugPrint('Data diambil dari lokal json.');
  }
}
