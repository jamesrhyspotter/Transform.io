import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SetWorkoutScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    List<String> inputList = [
      'Hello',
      'My',
      'Name',
      'Is',
      'Jeff'
    ];

    final List<int> _items = List<int>.generate(8, (int index) => index);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Scaffold(
        body: ReorderableListView(
          children: <Widget>[
            for (int index = 0; index < _items.length; index++)
             Card(

               key: Key('$index'),
               child: ListTile(
                key: Key('$index'),
                  leading: CircleAvatar(child: Icon(Icons.account_circle_sharp, color: Colors.white,), backgroundColor: Colors.amber[800],),
                  title: Text('Exercise ${_items[index]}', style: GoogleFonts.montserrat()),
                  subtitle: Row(
                    children: [
                      Icon(Icons.star_border, color: Colors.amber[800],),
                      Icon(Icons.star_border, color: Colors.amber[800]),
                      Icon(Icons.star_border, color: Colors.amber[800]),
                      Icon(Icons.star_border, color: Colors.amber[800]),
                      Icon(Icons.star_border, color: Colors.amber[800]),
                      Icon(Icons.star, color: Colors.amber[800]),
                    ],
                  ),
                  trailing: FlatButton(
                    child: Icon(Icons.refresh, color: Colors.white),
                    onPressed: (){

                    },
                  ),
                ),
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(18.0),
                   side: BorderSide(color: Colors.amber[800], width: 2)),
             )
          ],
          onReorder: (int oldIndex, int newIndex) {
            // setState(() {
            //   if (oldIndex < newIndex) {
            //     newIndex -= 1;
            //   }
            //   final int item = _items.removeAt(oldIndex);
            //   _items.insert(newIndex, item);
            // });
          },
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.amber[800],
        onPressed: (){

        },
      ),
    );
  }
}
