require "rails_helper"

RSpec.describe Book do
  describe "#initialize" do
    it "creates a new book with ISBN and title" do
  
      attributes = { isbn: "1234567890", title: "Sample Book" }

      book = Book.new(attributes)

      expect(book).to be_a(Book)
      expect(book.isbn).to eq(attributes[:isbn])
      expect(book.title).to eq(attributes[:title])
    end
  end
end
