import 'task1.dart';

void main() {
  Novel novel = Novel(title:'beloved',author: 'toni',no_Ofpage: 324,gener: 'realism');
  novel.display();
}

class Novel extends Book {
  String? gener;
  Novel({super.title, super.author, super.no_Ofpage, this.gener});
  @override
  void display() {
    super.display();
    print('the gener: $gener');
  }
}
