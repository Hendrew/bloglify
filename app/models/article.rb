# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :active, inclusion: { in: [true, false] }

  before_save :set_slug

  private

  def set_slug
    self.slug = title.to_s.parameterize
  end
end
