require "rails_helper"

RSpec.describe BookFacade do
  describe "#search_books" do
    it "searches for books by location and quantity" do
      location = "Reno, NV"
      quantity = 10
      mock_book_data = [
        { isbn: "1234567890", title: "Book 1" },
        { isbn: "0987654321", title: "Book 2" },
      ]

      allow(BookService).to receive(:search_books).with(location, quantity).and_return(mock_book_data)
      books_data = BookFacade.search_books(location, quantity)

      expect(books_data).to be_a(Hash)
      expect(books_data).to have_key(:books)
      expect(books_data[:books]).to be_an(Array)
      expect(books_data).to have_key(:total_books_found)
      expect(books_data[:total_books_found]).to eq(mock_book_data.count)
    end
  end
end
