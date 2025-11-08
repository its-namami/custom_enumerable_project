# frozen_string_literal: true

# Extended enumertable with my own implementation of their methods
module Enumerable
  # Your code goes here
end

# Extended array with my_each
class Array
  def my_each
    return self unless block_given?

    for i in 0...length
      yield self[i]
    end

    self
  end
end
