class Item < ApplicationRecord
  attachment :image
  has_many :cart_items, dependent: :destroy
  has_many :order_items
  belongs_to :genre

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :genre_id, presence: true

  def with_tax_price
    (price * 1.1).floor
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
