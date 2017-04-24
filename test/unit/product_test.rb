#coding:utf-8
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test "the truth" do
  	product = Product.new
	assert product.invalid?
	assert product.errors[:title].any?
	assert product.errors[:price].any?
	assert product.errors[:description].any?
  end
  test "is title unique" do
  	product = Product.new(
      title:products(:Ruby).title,
      description:"yyy",
      price:123)
  	assert !product.save
  	assert_equal "has already been taken",product.errors[:title].join(';')
  end

  test "is title unique I18n" do
    product = Product.new(
      title:products(:Ruby).title,
      description:"yyy",
      price: 123)
    assert !product.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'),
				product.errors[:title].join(';')
  end
end
