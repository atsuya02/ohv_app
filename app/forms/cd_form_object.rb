# frozen_string_literal: true

class CdFormObject
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveRecord::AttributeAssignment

  attribute :format
  attribute :picture
  attribute :title
  attribute :release_date
  attribute :price
  attribute :url
  attribute :songs
  attribute :form_count

  validates :form_count, presence: true

  def execute
    return false unless valid?

    save!
  end

  def save!
    ActiveRecord::Base.transaction do
      cd = Cd.new(format: format, picture: picture, title: title, release_date: release_date, price: price, url: url)
      cd.save!
      form_count.times.each do |num|
        song = cd.songs.build(name: songs["name_#{num + 1}"], track_number: songs["track_number_#{num + 1}"])
        song.save!
      end
    end
    true
  rescue StandardError => e
    errors.add(:base, e.message.split(","))
    false
  end
end
