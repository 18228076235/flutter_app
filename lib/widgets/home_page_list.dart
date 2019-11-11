import 'package:flutter/material.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid_app/common/Http.dart';
import 'package:wanandroid_app/models/repo.dart';

class HomeList extends StatefulWidget {
  HomeList({Key key}) : super(key: key);

  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List<Repo> listData = [];
  @override
  void initState() {
    _getIntData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            _getIntData();
          },
          child: Text('data'),
        ),
        // ListView.builder(
        //   itemBuilder: (BuildContext context, int index) =>
        //       _buildItem(context, index),
        // )
      ],
    ));
  }

  void _getIntData() async {
    try {
      List<Repo> data;
      data = await Http(context).getRepos(
        refresh: false,
        queryParameters: {'page': 0, 'page_size': 1},
      );
      print(666);
      print(data);
      this.setState(() {
        listData = data;
      });
    } catch (e) {
      print(e);
      this.setState(() {
        listData = [];
      });
    }
  }

  Widget _buildItem(BuildContext context, int index) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: ListTile(
          title: Text('data'),
        ),
      ),
    );
  }
}
