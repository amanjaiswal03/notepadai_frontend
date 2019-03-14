import 'package:flutter/material.dart';

class ListViewTranscripts extends StatefulWidget {
  @override
  _ListViewTranscriptsState createState() => _ListViewTranscriptsState();
}

class _ListViewTranscriptsState extends State<ListViewTranscripts> {
  @override
  List<String> litems = ['hey', 'was', 'doch'];
  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }
  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: litems.length,
      itemBuilder: (context, i) {
        return _buildRow(i);
      },
    );
  }
  Widget _buildRow(int Index) {
      return new Text(litems[Index]);
  }
}
