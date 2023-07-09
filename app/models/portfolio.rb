class Portfolio < ApplicationRecord
  validates :title, presence: true
  validates :main_image, presence: true
  validates :thumb_image, presence: true

  def self.angular 
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails')}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "https://via.placeholder.com/600x400"
    self.thumb_image ||= "https://via.placeholder.com/350x200"
  end
end
