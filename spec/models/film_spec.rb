require "rails_helper"

RSpec.describe Film, type: :model do
  describe "db schema" do
    context "columns" do
        it { should have_db_column(:name).of_type(:string) }
        it { should have_db_column(:description).of_type(:text) }
        it { should have_db_column(:type_films).of_type(:integer) }
        it { should have_db_column(:present).of_type(:datetime) }
        it { should have_db_column(:status).of_type(:integer) }
        it { should have_db_column(:image).of_type(:string) }
        it { should have_db_column(:trailer).of_type(:string) }
    end
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:image)}
    it {should validate_presence_of(:trailer)}
    it {should validate_length_of(:name)}
    it {should validate_length_of(:description)}
  end

  describe "associations" do
    it {should have_many :schedules}
    it {should have_many(:rooms).through(:schedules)}
    it {should have_many(:tickets).through(:schedules)}
  end
end
