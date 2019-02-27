require "rails_helper"

RSpec.describe Room, type: :model do
  describe "db schema" do
    context "columns" do
      it { should have_db_column(:status).of_type(:string) }
    end
  end

  describe "validations" do
  end

  describe "associations" do
    it {should have_many :schedules}
    it {should have_many :seats}
    it {should have_many(:films).through(:schedules)}
    it {should have_many(:tickets).through(:schedules)}
  end
end
