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

  def my_select
    return enum_for(:my_each) unless block_given?

    selected = []

    my_each { |element| selected << element if yield element }

    selected
  end

  def my_count
    return size unless block_given?

    count = 0

    my_each { |element| count += 1 if yield element }

    count
  end

  def my_any?(&block)
    block ||= ->(element) { element }

    my_each { |element| return true if block.call(element) }

    false
  end

  def my_none?
    return empty? unless block_given?

    my_each { |element| return false if yield element }

    true
  end

  def my_all?
    return true unless block_given?

    my_each { |element| return false unless yield element }

    true
  end

  def my_inject(inject)
    return enum_for(:my_inject) unless block_given?

    my_each { |element| inject = yield inject, element }

    inject
  end

  def my_map
    return enum_for(:map) unless block_given?

    map = []

    my_each { |element| map << yield(element) }

    map
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
