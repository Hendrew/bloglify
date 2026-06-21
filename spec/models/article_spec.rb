# frozen_string_literal: true

require "rails_helper"

RSpec.describe Article, type: :model do
  let!(:article) { create(:article) }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }

    it { is_expected.to validate_uniqueness_of(:title) }

    it { is_expected.to allow_value(%w[true false]).for(:active) }
  end
end
