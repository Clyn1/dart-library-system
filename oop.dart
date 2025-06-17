/// A simple console-based library system using OOP in Dart.

/// Represents a book in the library.
class Book {
  String title;
  String author;
  bool _isBorrowed = false; // private flag → users access via methods

  Book(this.title, this.author); //constructor--

  bool get isBorrowed => _isBorrowed;

  /// Marks the book as borrowed if it's available.
  void borrow() {
    if (!_isBorrowed) {
      _isBorrowed = true;
      print('You borrowed "$title".');
    } else {
      print('Sorry, "$title" is already borrowed.');
    }
  }

  /// Returns the book if it's currently borrowed.
  void returnBook() {
    if (_isBorrowed) {
      _isBorrowed = false;
      print('You returned "$title".');
    } else {
      print('"$title" was not borrowed.');
    }
  }

  @override
  String toString() {
    // Display title, author, and availability
    return '"$title" by $author' +
        (_isBorrowed ? ' (borrowed)' : ' (available)');
  }
}

/// Manages a collection of books.
class Library {
  List<Book> _books = []; // private book list

  /// Adds a new book to the library.
  void addBook(Book book) {
    _books.add(book);
    print('Added "${book.title}" to the library.');
  }

  /// Displays all books with their status.
  void listBooks() {
    print('\nLibrary Collection:');
    for (var book in _books) {
      print('- $book');
    }
  }

  /// Finds a book by its title (exact match).
  Book? findBook(String title) {
    return _books.firstWhere(
      (b) => b.title == title,
      orElse: () => null,
    );
  }
}

void main() {
  // Create a library instance
  var library = Library();

  // Add some books
  library.addBook(Book('1984', 'George Orwell'));
  library.addBook(Book('The Hobbit', 'J.R.R. Tolkien'));
  library.addBook(Book('Dart in Action', 'Chris Buckett'));

  // Show all books
  library.listBooks();

  // Borrow a book
  var book = library.findBook('1984');
  book?.borrow();

  // Try borrowing it again
  book?.borrow();

  // Return the book
  book?.returnBook();

  // Final state of library
  library.listBooks();
}
