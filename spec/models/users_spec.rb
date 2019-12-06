require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  describe "Validations" do
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_uniqueness_of(:email).case_insensitive }

    it { expect(user).to validate_presence_of(:password) }
    it { expect(user).to validate_length_of(:password).is_at_least(6) }

    it { expect(user).to validate_presence_of(:address) }
    it { expect(user).to validate_presence_of(:full_name) }

    it { expect(user).to validate_presence_of(:phone) }
    it { expect(user).to validate_numericality_of(:phone) }
    it { expect(user).to validate_length_of(:phone).is_at_least(10) }
    it { expect(user).to validate_length_of(:phone).is_at_most(11) }
  end

  describe "Enums" do
    it { should define_enum_for(:role).with_values({ general: 0, admin: 1 }) }
  end
end
