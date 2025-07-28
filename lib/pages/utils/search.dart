import 'package:flutter/material.dart';
import 'package:yara/pages/prepaidrecharge.dart';

class Search extends SearchDelegate {
  final List<String> data;

  Search({required this.data});

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.green.shade200,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(color: Colors.black, fontSize: 20),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results =
        data
            .where(
              (element) => element.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions =
        data
            .where(
              (element) =>
                  element.toLowerCase().startsWith(query.toLowerCase()),
            )
            .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            query = suggestions[index];
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrepaidRecharge()),
            );
          },
        );
      },
    );
  }
}
