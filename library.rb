class Library

  @@books = {}
  # See the books currently in the library.
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
  # user - An instance of the User class.
  def check_out(book, user)
    user.check_out(@@books[book.title])
  end
end

class Book
  attr_reader :author, :title, :description, :due_date
  def initialize(author, title, description)
    @author = author
    @title = title
    @description = description
    @due_date = nil
  end
end

class User
  @@checked_out_books = {}

  # See the books currently checked out.
  def to_s
    puts "#{@@checked_out_books}"
  end

  # Check out a book.
  #
  # book - An instance of the book class from the library.
  def check_out(book)
    @@checked_out_books[book.title] = book
    @@checked_out_books[book.due_date] = Time.now + 604800
    puts "The book is due #{@@checked_out_books[book.due_date].asctime}"
  end
end

# ====================================================================
# For testing

# Create library
lib = Library.new

# Create books
book_1 = Book.new("First Author", "Ruby Book 1", "Description of book 1")
book_2 = Book.new("Second Author", "Ruby Book 2", "Description of book 2")
book_3 = Book.new("Third Author", "Ruby Book 3", "Description of book 3")

# Create user
user_1 = User.new

# Add books to library
lib.add_book(book_1)
lib.add_book(book_2)
lib.add_book(book_3)

# Check out book
lib.check_out(book_1, user_1)

# Test
# user_1.to_s
