FactoryBot.define do
  factory :film do
    after :create do |b|
      b.update_column(:photo, "foo/bar/baz.png")
    end
  end
end
