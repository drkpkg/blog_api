class ContentPage < ApplicationRecord

  validates_uniqueness_of :url, message: "URL exists in the data"
end
