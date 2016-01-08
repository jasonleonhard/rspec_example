# class Book
#     attr_accessor :title, :author, :category
#         def initialize title, author, category
#             @title = title
#             @author = author
#             @category = category
#         end
# end

# # Passing a hash to a function (*args)
# class Book
#     attr_accessor :title, :author, :category
#         def initialize(*args)
#             @title = args[0]
#             @author = args[1]
#             @category = args[2]
#         end
# end

# # Passing a hash to a function (*args)
# class Book
#   attr_accessor :title, :author, :category
#     def initialize(*args)
#       # puts args
#       # puts args.length

#       @title, @author, @category = args

#       # args.each do |k,v|
#       #   instance_variable_set("@#{k}", v) unless v.nil?
#       #   # @title = i
#       #   # @author = i
#       #   # @category = i
#       # end
#     end
# end

# Another technique that Ruby allows is to give a Hash when invoking a function, and that gives you best of all worlds: named parameters, and variable argument length.
# args array created
class Book
  attr_accessor :title, :author, :category
    def initialize *args
      @title, @author, @category = args
   end
end
