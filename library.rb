class Library

  @@books = {}
  def to_s
    puts "#{@@books}"
  end

  # Add a book to the library.
  #
  # book - An instance of the Book class.
  def add_book(book)
    @@books[book.title] = book
  end

  # Check out a book.
  #
  # book - An instance of the Book class from @@books.
  def check_out(book)
  end
end

class Book
  attr_reader :author, :title, :description
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
book_1 = Book.new("First Author", "Ruby Book 1", "Description of book 1")
book_2 = Book.new("Second Author", "Ruby Book 2", "Description of book 2")
book_3 = Book.new("Third Author", "Ruby Book 3", "Description of book 3")

lib.add_book(book_1)
lib.add_book(book_2)
lib.add_book(book_3)

lib.to_s
