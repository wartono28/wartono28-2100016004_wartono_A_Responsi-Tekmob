import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _beratBadanController = TextEditingController();

  final TextEditingController _tinggiBadanController = TextEditingController();

  double hasil = 0;
  String kategori = "";
  late Color pewarnaan;

  @override
  Widget build(BuildContext context) {
    if (hasil < 18.5) {
      kategori = "Kurang Berat Badan";
      pewarnaan = Colors.yellow;
    } else if (hasil > 18.5 && hasil < 25) {
      kategori = "normal";
      pewarnaan = Colors.green;
    } else if (hasil > 25) {
      kategori = "Kelebihan Berat Badan";
      pewarnaan = Colors.red;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('2100016004_Wartono'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _beratBadanController,
            decoration: const InputDecoration(labelText: 'Berat Badan'),
          ),
          TextField(
            controller: _tinggiBadanController,
            decoration: const InputDecoration(labelText: 'Tinggi Badan'),
          ),
          const SizedBox(height: 20),
          Text(
            "Kategori: $kategori",
            style: TextStyle(color: pewarnaan),
          ),
          ElevatedButton(
            onPressed: () {
              int intBeratBadan = int.parse(_beratBadanController.text);
              double intTinggiBadan =
                  int.parse(_tinggiBadanController.text) / 100;
              double intPowTinggiBadan = (intTinggiBadan * intTinggiBadan);

              setState(() {
                hasil = (intBeratBadan / intPowTinggiBadan);
              });
              print(hasil);
            },
            child: const Text("Hitung"),
          ),
        ],
      ),
    );
  }
}
