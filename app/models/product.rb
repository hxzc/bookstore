class Product < ActiveRecord::Base
  attr_accessible :price, :title,:description
  validates :price,:title,:description, presence:true
  validates :price, numericality:{greater_than_or_equal_to:0.01}
  validates :title, uniqueness:true
  #validates :title, length:{minimum:5,maximum:10}
  #validates_length_of :title, maximum:10	#验证字符长度
end
