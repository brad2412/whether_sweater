class BookFacade
  def self.search_books(location, quantity)
    book_data = BookService.search_books(location, quantity)
    books = book_data.map do |attributes|
      {
        isbn: attributes[:isbn],
        title: attributes[:title]
      }
    end

    total_books_found = books.count 

    {
      books: books,
      total_books_found: total_books_found 
    }
  end
end
