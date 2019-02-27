require "rails_helper"

RSpec.describe Schedule, type: :model do
  describe "db schema" do
    context "columns" do
      it { should have_db_column(:room_id).of_type(:integer) }
      it { should have_db_column(:film_id).of_type(:integer) }
      it { should have_db_column(:showtime).of_type(:datetime) }
    end
  end

  describe "validations" do
    it {should validate_uniqueness_of(:showtime).scoped_to(:room_id)}
  end

  describe "associations" do
    it { should belong_to(:film) }
    it {should have_many :tickets}
    it {should have_many(:seats).through(:room)}
    it { should belong_to(:room) }
  end
end
