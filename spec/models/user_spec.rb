require "rails_helper"

RSpec.describe User, type: :model do
  let(:valid_attributes) {
    {
      name: "Jacqueline",
      email: "jboltik@oolaabox.com",
      password: "password",
      password_confirmation: "password"
    }
  }
  describe "db schema" do
    context "columns" do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:phone).of_type(:string) }
      it { should have_db_column(:wallet).of_type(:integer) }
      it { should have_db_column(:isAdmin).of_type(:boolean) }
      it { should have_db_column(:password_digest).of_type(:string) }
      it { should have_db_column(:remember_digest).of_type(:string) }
    end
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
    it {should have_secure_password}
    it {should validate_length_of(:password)}
    it {should validate_length_of(:name)}
    it {should validate_length_of(:email)}
    it {should validate_length_of(:phone)}
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe "associations" do
    it {should have_many :tickets}
  end

  describe "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "JBOLTIK@OOLAABOX.COM"))
      expect{ user.send(:downcase_email) }.to change{ user.email }.
        from("JBOLTIK@OOLAABOX.COM").
        to("jboltik@oolaabox.com")
    end
  end
end
