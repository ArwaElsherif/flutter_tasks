void main() {
  Book book = Book(title: 'beloved',no_Ofpage: 324); // delete author bec this is not required
  book.display();
}

class Book {
  String? title;
  String? author;
  int? no_Ofpage;
  Book({required this.title, this.author, this.no_Ofpage});

  get get_title => title;
  get get_author => author;
  get get_no_Ofpage => no_Ofpage;

  void display() {
    print('the title: $title');
    print('the author: $author');
    print('the number of page: $no_Ofpage');
  }
}
