#coding:utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Product.delete_all
Product.create(
	title:"Ruby",
	price:50.50,
	description:%{Ruby 是一门面向对象的编程语言。}
)
Product.create(
	title:"Java",
	price:50.50,
	description:%{Java 是一门面向对象的编程语言。}
)