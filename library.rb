class Library
  def initialize
    @books = {}
  end

  # See the books currently in the library.
  def to_s
    puts "This library has:"
    @books.each do | name, book |
      print name
      print " (checked out by #{book.user})" unless book.user == nil
      puts
    end
    # puts @books
  end

  # Add a book to the library.
  #
  # book - An instance of the Book class.
  def add_book(book)
    @books[book.title] = book
  end

  # Check out a book.
  #
  # book - An instance of the Book class from @books.
  # user - An instance of the User class.
  def check_out(book, user)
    user.check_out(@books[book.title])
  end

  # Check in a book.
  #
  # book - An instance of the Book class which has been checked out.
  # user - An instance of the User class.
  def check_in(book, user)
    user.check_in(@books[book.title])
  end
end

class Book
  attr_accessor :author, :title, :description, :user, :due_date
  def initialize(author, title, description)
    @author = author
    @title = title
    @description = description
  end

  # View book details.
  def to_s
    puts "\"#{@title}\" by #{@author}: #{@description}"
    if @user == nil
      puts "This book is available."
    else
      puts "#{@user} has checked this book out."
    end
  end
end

class User
  def initialize(name)
    @name = name
    @checked_out_books = {}
  end

  # See the books currently checked out.
  def to_s
    puts "CHECKED OUT:"
    @checked_out_books.each do | name, book |
      puts "\"#{name}\" by #{book.author}"
    end
  end

  def overdue_books?
    if @checked_out_books.length > 0
      @checked_out_books.each do | name, book |
        return book.due_date < Time.now
      end
    end
  end

  # Check out a book.
  #
  # book - An instance of the book class from the library.
  def check_out(book)
    if @checked_out_books.length <= 2 && !overdue_books?
      @checked_out_books[book.title] = book
      @checked_out_books[book.title].due_date = Time.now + 604800
      book.user = @name
      puts "Checked out #{book.title}. It's due #{@checked_out_books[book.title].due_date.asctime}"
    elsif overdue_books?
      puts "You have overdue books. Please return them before checking out anything else."
    else
      puts "Only 2 books are allowed to be checked out at a time."
    end
  end

  # Check in a book.
  #
  # book - An instance of the book class from the library.
  def check_in(book)
    @checked_out_books.each do | name, hash |
      if book == hash
        @checked_out_books.delete(name)
        book.user = nil
        book.due_date = nil
      end
    end
  end
end

# ====================================================================
# For testing

# Create library
lib = Library.new

# Create books
book_1 = Book.new("First Author", "Ruby Book 1", "Description of book 1.")
book_2 = Book.new("Second Author", "Ruby Book 2", "Description of book 2.")
book_3 = Book.new("Third Author", "Ruby Book 3", "Description of book 3.")

# Create user
user_1 = User.new("User 1")
user_2 = User.new("User 2")

# Add books to library
lib.add_book(book_1)
lib.add_book(book_2)
lib.add_book(book_3)

# Check out book
lib.check_out(book_1, user_1)
lib.check_out(book_2, user_1)

# Check one back in
lib.check_in(book_1, user_1)

puts
user_1.to_s
