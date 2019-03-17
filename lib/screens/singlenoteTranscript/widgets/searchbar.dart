import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchList extends StatefulWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
  SearchList({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SearchListState createState() => new _SearchListState();

}

class _SearchListState extends State<SearchList>
{
  Widget appBarTitle = PreferredSize(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Text(
              "Biology Lecture - Myosis",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                DateFormat('dd/MM yy').format(new DateTime.now()),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              Row (
                children: <Widget>[
                  Icon(Icons.access_time, color: Colors.white, size: 16),
                  Text(
                    " "+DateFormat('kk:mm').format(DateTime.now()),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
    preferredSize: Size(0.0, 80.0),
  );
  Icon actionIcon = new Icon(Icons.search, color: Colors.white,);
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  List<String> _list;
  bool _IsSearching;
  String _searchText = "";

  _SearchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      }
      else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();

  }

  void init() {
    _list = List();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: buildBar(context),
      body: new ListView(
        children: _IsSearching ? _buildSearchList() : _buildList(),
      ),
    );
  }

  List<ChildItem> _buildList() {
    return _list.map((contact) => new ChildItem(contact)).toList();
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => new ChildItem(contact))
          .toList();
    }
    else {
      List<String> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        String  name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => new ChildItem(contact))
          .toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(
        centerTitle: true,
        title: appBarTitle,
        actions: <Widget>[
          new IconButton(icon: actionIcon, onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon = new Icon(Icons.close, color: Colors.white,);
                this.appBarTitle = new TextField(
                  controller: _searchQuery,
                  style: new TextStyle(
                    color: Colors.white,

                  ),
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search, color: Colors.white),
                      hintText: "Search...",
                      hintStyle: new TextStyle(color: Colors.white)
                  ),
                );
                _handleSearchStart();
              }
              else {
                _handleSearchEnd();
              }
            });
          },),
        ]
    );
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(Icons.search, color: Colors.white,);
      this.appBarTitle = PreferredSize(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Align(
          alignment: Alignment.centerLeft,
          child: Container(
          child: Text(
          "Biology Lecture - Myosis",
          style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
      ),
      ),
      ),
      ),
      Align(
      alignment: Alignment.centerLeft,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      Text(
      DateFormat('dd/MM yy').format(new DateTime.now()),
      style: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      ),
      ),
      Row (
      children: <Widget>[
      Icon(Icons.access_time, color: Colors.white, size: 16),
      Text(
      " "+DateFormat('kk:mm').format(DateTime.now()),
      style: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      ),
      ),
      ],
      )
      ],
      ),
      ),
      ],
      ),
      );
    });
  }

}

class ChildItem extends StatelessWidget {
  final String name;
  ChildItem(this.name);
  @override
  Widget build(BuildContext context) {
    return new ListTile(title: new Text(this.name));
  }

}
