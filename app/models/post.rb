class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def categories_attributes=(ca)
    ca.values.each do |c|
      next if c['name'].empty?

      categories << Category.find_or_create_by(c)
    end
  end
end
