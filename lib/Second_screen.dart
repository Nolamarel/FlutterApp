import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/item_provider.dart';
//import 'main.dart';
//ignore_for_file: prefer_const_constructors

void main() => runApp(SecondScreen());


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Provider',
        home: _SecondScreen(),
      ),
    );
  }
}



class _SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Changing Lists"),
        backgroundColor: Colors.orange[100],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<ItemProvider>(
              builder: (context, itemProvider, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: itemProvider.items.length,
                    itemBuilder: (context, index) {
                      final item = itemProvider.items[index];
                      return ListTile(
                        title: Text("${item.name}"),
                        onTap: (){},
                      );
                    },
                  ),
                );
              },
            ),
            FloatingActionButton(
              onPressed: () { Provider.of<ItemProvider>(context, listen: false).addItem('New Item');},
              child: const Icon(Icons.add),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}









