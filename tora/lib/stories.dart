import 'news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Storiespage extends StatelessWidget {
  const Storiespage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchdata;
    return Scaffold(
     appBar: AppBar(
       actions: [
         IconButton(
           icon: Icon(Icons.refresh),
           onPressed:() {
             context.read<NewsData>().initialValues();
              context.read<NewsData>().fetchdata;
           },
         )
       ],
       title: Text('ggg'),
     ),
     body: RefreshIndicator(
       onRefresh: () async {
        await context.read<NewsData>().fetchdata;
       },
       child: Center(
        child: Consumer<NewsData>(
        builder: (context, value, child) {
          return value.map.length == 0 && !value.error 
          ? CircularProgressIndicator() 
          : value.error ? Text('oops,something went wrong ${value.errorMessage}'
          ,textAlign: TextAlign.center,) : 
          ListView.builder(
            itemCount: value.map.length,
            itemBuilder: (context,index) {
            print(value.map.map(((element) => element)));
            
            return Newscard(map: value.map[index]);
          },
          );
        },
        ),
       ),
     ), 
    );
  }
}

class Newscard extends StatelessWidget {
  const Newscard({ Key? key,required this.map }) : super(key: key);
final Map<String,dynamic> map;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation:10 ,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('${map['image']}'),
            SizedBox(
              height: 10,
            ),
            Text('${map['heading']}'
            ),
           SizedBox(
              height: 10,
            ),
              Text('${map['story']}'
            ),
            ],
            
          ),
        ),
      ),
    );
  }
}




