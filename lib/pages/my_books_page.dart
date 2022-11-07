import 'package:flutter/material.dart';
import 'package:my_libros/pages/new_book_page.dart';

class MyBooksPage extends StatefulWidget {
  const MyBooksPage({Key? key}) : super(key: key);

  @override
  State<MyBooksPage> createState() => _MyBooksPageState();
}

class _MyBooksPageState extends State<MyBooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Mis Libros'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 16.0,
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton (
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NewBookPage()));
        },
        tooltip: 'New Book',
        child: const Icon(Icons.add),
      ),
    );
  }
}

