class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
  
  include Placeholder
  validates :title, presence: true
  validates :main_image, presence: true
  validates :thumb_image, presence: true

  def self.angular 
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails')}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
