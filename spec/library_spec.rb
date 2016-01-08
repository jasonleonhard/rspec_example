require 'spec_helper'
 
describe "Library object" do
    # we create an array of books. Then we open the file “books.yml” (in “w”rite mode) and use YAML to dump the array into the file.
    # The YAML module has two main methods you’ll use: dump, which outputs the serialized data as a string. Then, load takes the data string and coverts it back to Ruby objects.
    before :all do
        lib_obj = [
            Book.new("JavaScript: The Good Parts", "Douglas Crockford", :development),
            Book.new("Designing with Web Standards", "Jeffrey Zeldman", :design),
            Book.new("Don't Make me Think", "Steve Krug", :usability),
            Book.new("JavaScript Patterns", "Stoyan Stefanov", :development),
            Book.new("Responsive Web Design", "Ethan Marcotte", :design)
        ]
        File.open "books.yml", "w" do |f|
            f.write YAML::dump lib_obj
        end
    end
    # Before :each test, we’re going to create a Library object, passing it the name of the YAML file. 
    before :each do
        @lib = Library.new "books.yml"
    end
 
    # Now let’s see the tests:
    # context shows the two behaviours for using Library#new.
    # lib should have 0 books shows we need a books property that is an 
    # array of the books we have
    describe "#new" do
     
        # context "with no parameters" do
        #     it "has no books" do
        #         lib = Library.new
        #         lib.should have(0).books
        #     end
        # end
        # context "with a yaml file parameter" do
        #     it "has five books" do
        #         @lib.should have(5).books
        #     end
        # end
    end
       
    # Then, we have three other tests to test the functionality of getting books by category, adding a book to the library, and saving the library. 
    # These are all failing, so let’s write the class now.
    it "returns all the books in a given category" do
        @lib.get_books_in_category(:development).length.should == 2
    end
     
    it "accepts new books" do
        @lib.add_book( Book.new("Designing for the Web", "Mark Boulton", :design) )
        @lib.get_book("Designing for the Web").should be_an_instance_of Book
    end
     
    it "saves the library" do
        books = @lib.books.map { |book| book.title }
        @lib.save
        lib2 = Library.new "books.yml"
        books2 = lib2.books.map { |book| book.title }
        books.should eql books2
    end
end

# A Few Last Matchers
# Before we wrap up, let me show you a couple of other matchers:
    # obj.should be_true, obj.should be_false, obj.should be_nil, obj.should be_empty - the first three of these could be done by == true, etc. be_empty will be true if obj.empty? is true.
    # obj.should exist - does this object even exist yet?
    # obj.should have_at_most(n).items, object.should have_at_least(n).items - like have, but will pass if there are more or fewer than n items, respectively.
    # obj.should include(a[,b,...]) - are one or more items in an array?
    # obj.should match(string_or_regex) - does the object match the string or regex?
    # obj.should raise_exception(error) - does this method raise an error when called?
    # obj.should respond_to(method_name) - does this object have this method? Can take more than one method name, in either strings or symbols.

# http://rspec.info/
# https://pragprog.com/book/achbd/the-rspec-book # TDD and BDD in Ruby    

# check if 'describe' & 'it' can be interchanged