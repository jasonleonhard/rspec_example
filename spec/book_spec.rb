require 'spec_helper'
 
describe Book do

  before :each do
      @book = Book.new "Title", "Author", :category
  end

  # Our test simply confims that we’re indeed made a Book object.
  # new method takes param, returns book obj as an instnce of book
  # instance variable @book should ____ ObjectName
  describe "#new" do
    it "takes three parameters and returns a Book object" do
        @book.should be_an_instance_of Book
    end
  end

  describe "#title" do
      it "returns the correct title" do
          @book.title.should eql "Title"
      end
  end
  describe "#author" do
      it "returns the correct author" do
          @book.author.should eql "Author"
      end
  end
  describe "#category" do
      it "returns the correct category" do
          @book.category.should eql :category
      end
  end
  # eql   ~ true if obj have same content
  # ==    ~ same as above
  # equal ~ must be same exact object in memory

end
# rspec spec

# recommend to use expect not should syntax now...?

