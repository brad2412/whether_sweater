class Book
  attr_reader :isbn, :title

  def initialize(attributes)
    @isbn = attributes[:isbn]
    @title = attributes[:title]
  end
end
