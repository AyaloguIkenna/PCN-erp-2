import 'package:flutter/material.dart';
import 'package:pcn_erp/bible/models/book.dart';
import 'package:pcn_erp/bible/pages/chapters_list_page.dart';
import 'package:pcn_erp/bible/pages/search_page.dart';
import 'package:pcn_erp/bible/services/books_bloc.dart';
import 'package:pcn_erp/bible/utils/constants.dart';
import 'package:pcn_erp/bible/utils/navigator.dart';
import 'package:pcn_erp/bible/utils/widgets.dart';

class BooksListPage extends StatefulWidget {
  final Testament testament;

  BooksListPage(this.testament);

  @override
  _BooksListPageState createState() => _BooksListPageState();
}

class _BooksListPageState extends State<BooksListPage> {
  String title;
  BooksBloc _bloc = BooksBloc();

  @override
  void initState() {
    super.initState();
    _bloc.booksList(widget.testament);
    title = _bloc.booksTitle(widget.testament);
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.withOpacity(0.7),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: background),
            onPressed: () {
              push(context, SearchPage(widget.testament));
            },
          ),
          IconButton(
            icon: Icon(Icons.home, color: inverse),
            onPressed: () => goHome(context),
          ),
        ],
        title: Text(title),
      ),
      body: _body(),
    );
  }

  _body() {
    return StreamBuilder(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return centerText("Error reading book list.");

          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          List<Book> books = snapshot.data;

          return Scrollbar(
            child: ListView.builder(
              itemExtent: 45,
              itemCount: (books != null) ? books.length : 0,
              itemBuilder: (context, index) => _itemView(context, books, index),
            ),
          );
        });
  }

  _itemView(context, books, index) {
    Book book = books[index];
    int idxBook = index;

    return ListTile(
      title: Text(
        book.bookName,
        style: TextStyle(fontSize: fontSize),
      ),
      onTap: () {
        push(context, ChaptersListPage(books, idxBook));
      },
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
