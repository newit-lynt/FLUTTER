import 'package:flutter/material.dart';

class SearchWeatherPage extends StatefulWidget {
  const SearchWeatherPage({super.key});

  static PageRoute route() {
    return MaterialPageRoute(builder: (_) => const SearchWeatherPage());
  }

  @override
  State<SearchWeatherPage> createState() => _SearchWeatherPageState();
}

class _SearchWeatherPageState extends State<SearchWeatherPage> {
  final TextEditingController _textController = TextEditingController();
  String get _text => _textController.text;
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('City Search')),
        body: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    hintText: 'Chicago',
                  ),
                ),
              ),
            ),
            IconButton(
              key: const Key('searchPage_search_iconButton'),
              icon: const Icon(Icons.search, semanticLabel: 'Submit'),
              onPressed: () {
                Navigator.of(context).pop(_text);
              },
            )
          ],
        ),
      ),
    );
  }
}
