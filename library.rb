class Library

  @@books = {}

  # Add a book to the library.
  #
  # book - An instance of the Book class.
  def add_book(book)
  end

  # Check out a book.
  #
  # book - An instance of the Book class from @@books.
  def check_out(book)
  end
end

class Book
  def initialize(author, title, description)
    @author = author
    @title = title
    @description = description
  end
end

class User
  @@checked_out_books = {}
end

# ====================================================================
# For testing

lib = Library.new
book_1 = Book.new
book_2 = Book.new
book_3 = Book.new
