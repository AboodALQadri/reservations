import 'package:flutter/material.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

class DataSearch extends SearchDelegate {
  List names = ['abood', 'ahmed', 'basel', 'mohammed', 'sara'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return TextUtils(
      text: '$query',
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filternames =
        names.where((element) => element.contains(query)).toList();

    return ListView.builder(
      itemCount: query == '' ? names.length : filternames.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            query == '' ? names[index] : filternames[index];
            showResults(context);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: query == ''
                ? TextUtils(
                    text: '${names[index]}',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  )
                : TextUtils(
                    text: '${filternames[index]}',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
          ),
        );
      },
    );
  }
}
