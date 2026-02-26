import 'package:flutter/material.dart';
import 'models/country_model.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountryScreen(),
    );
  }
}

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {

  late Future<List<Country>> futureCountries;

  @override
  void initState() {
    super.initState();
    futureCountries = ApiService.fetchCountries();
  }

  Future<void> refreshData() async {
    setState(() {
      futureCountries = ApiService.fetchCountries();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: const [
            Text(
              "Countries REST API App",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 4),
            Text(
              "Akshar Patel | Enrollment: 20230905090502",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: FutureBuilder<List<Country>>(
          future: futureCountries,
          builder: (context, snapshot) {

            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error loading countries\n${snapshot.error}",
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (!snapshot.hasData ||
                snapshot.data!.isEmpty) {
              return const Center(
                child: Text("No data available"),
              );
            }

            final countries = snapshot.data!;

            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {

                final country = countries[index];

                return Card(
                  margin: const EdgeInsets.all(8),
                  elevation: 4,
                  child: ListTile(
                    leading: country.flag.isNotEmpty
                        ? Image.network(
                      country.flag,
                      width: 50,
                      height: 30,
                      fit: BoxFit.cover,
                    )
                        : const Icon(Icons.flag),
                    title: Text(
                      country.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text("Capital: ${country.capital}"),
                        Text("Region: ${country.region}"),
                        Text(
                          "Population: ${country.population}",
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}