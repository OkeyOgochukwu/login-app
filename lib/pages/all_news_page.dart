import 'package:assigned_task/model/news_model.dart';
import 'package:assigned_task/network/service_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  late Future<List<News>> _news;
  void initState() {
    super.initState();
    setState(() {
      _news = getAllNew();
    });
  }

  Widget build(BuildContext context) {
    // _news = getAllNew();

    return Scaffold(
      body: FutureBuilder<List<News>>(
        future: _news,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, item) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.grey[600],
                      child: ListTile(
                        isThreeLine: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),

                        title: Text(snapshot.data![item].link),
                        subtitle: Text(snapshot.data![item].published),
                        leading: Icon(Icons.favorite),
                        onTap: () {},
                        //,
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else
            return Center(
              child: const CircularProgressIndicator(),
            );
        },
      ),
    );
  }
}
