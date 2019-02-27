require "rails_helper"

RSpec.describe Seat, type: :model do
  describe "db schema" do
    context "columns" do
      it { should have_db_column(:room_id).of_type(:integer) }
      it { should have_db_column(:position).of_type(:string) }
    end
  end

  describe "validations" do
  end

  describe "associations" do
    it {should have_many :tickets}
    it { should belong_to(:room) }
  end
end
