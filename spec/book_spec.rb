require 'spec_helper'
 
describe Book do

  before :each do
      @book = Book.new "Title", "Author", :category
  end

  # Our test simply confims that we’re indeed made a Book object.
  describe "#new" do
    it "takes three parameters and returns a Book object" do
        @book.should be_an_instance_of Book
    end
  end

  # Notice the grammar we use here: object.should do_something. Ninety-nine percent of your tests will take this form: you have an object, and you start by calling should or should_not on the object. Then, you pass to that object the call to another function. In this case that’s be_an_instance_of (which takes Book as its single parameter). Altogether, this makes a perfectly readable test. It’s very clear that @book should be an instance of the class Book. So, let’s run it.

end