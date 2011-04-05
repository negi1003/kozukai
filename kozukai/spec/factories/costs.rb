# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :cost do |f|
  f.price "MyString"
  f.subject "MyString"
  f.date "2011-04-05"
  f.wday 1
end