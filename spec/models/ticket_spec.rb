require "rails_helper"

RSpec.describe Ticket, type: :model do
  describe "db schema" do
    context "columns" do
      it { should have_db_column(:schedule_id).of_type(:integer) }
      it { should have_db_column(:seat_id).of_type(:integer) }
      it { should have_db_column(:user_id).of_type(:integer) }
      it { should have_db_column(:price).of_type(:string) }
      it { should have_db_column(:status).of_type(:string) }
      it { should have_db_column(:soldtime).of_type(:datetime) }
    end
  end

  describe "validations" do
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:seat) }
    it { should belong_to(:schedule) }
  end
end
