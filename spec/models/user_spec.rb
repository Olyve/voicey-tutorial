# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  token         :string
#  password_hash :string
#  password_salt :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_token  (token)
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'Sam',
                      email: 'samgalizia@gmail.com',
                      password: 'test')
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      bad_user = User.new(name: nil,
                          email: 'test@mail.com',
                          password: 'test')
      expect(bad_user).to_not be_valid
    end

    it 'is invalid without an email' do
      bad_user = User.new(name: 'Sam',
                          email: nil,
                          password: 'test')
      expect(bad_user).to_not be_valid
    end

    it 'is invalid without a password' do
      bad_user = User.new(name: 'Sam',
                          email: 'samgalizia@gmail.com',
                          password: nil)
      expect(bad_user).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'should have many memos' do
      assoc = User.reflect_on_association(:memos)
      expect(assoc.macro).to eq :has_many
    end
  end
end
