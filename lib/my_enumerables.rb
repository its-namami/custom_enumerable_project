# frozen_string_literal: true

# Extended enumertable with my own implementation of their methods
module Enumerable
  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?

    index = 0

    my_each do |element|
      yield element, index
      index += 1
    end
  end

  def my_select(&block)
    return enum_for(:my_each) unless block_given?

    selected = []

    my_each do |element|
      selected << element if yield element
    end

    selected
  end

  def my_count
    return size unless block_given?

    count = 0

    my_each do |element|
      count += 1 if yield element
    end

    count
  end

  def my_none?
    return enum_for(:my_none) unless block_given?

    my_each do |element|
      return false if yield element
    end

    true
  end
end

# Extended array with my_each
class Array
  def my_each
    return enum_for(:my_each) unless block_given?

    for i in 0...length
      yield self[i]
    end

    self
  end
end
