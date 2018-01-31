# == Schema Information
#
# Table name: memos
#
#  id         :integer          not null, primary key
#  title      :string
#  date       :date
#  text_body  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_memos_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Memo, type: :model do
  subject {
    User.new(name: 'Sam', email: 'samgalizia@gmail.com')
  }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      memo = Memo.create(title: 'A memo',
                         date: DateTime.now.utc,
                         text_body: 'Body of the memo.',
                         user: subject)
      expect(memo).to be_valid
    end

    it 'is invalid with no title' do
      memo = Memo.create(title: nil,
                         date: DateTime.now.utc,
                         text_body: 'Body of memo',
                         user: subject)
      expect(memo).to_not be_valid
    end

    it 'is invalid with no date' do
      memo = Memo.create(title: 'A memo',
                         date: nil,
                         text_body: 'Body of memo',
                         user: subject)
      expect(memo).to_not be_valid
    end

    it 'is invalid with no text body' do
      memo = Memo.create(title: 'A memo',
                         date: DateTime.now.utc,
                         text_body: nil,
                         user: subject)
      expect(memo).to_not be_valid
    end

    it 'is invalid with no user' do
      memo = Memo.create(title: 'A memo',
                         date: DateTime.now.utc,
                         text_body: 'Body of memo',
                         user: nil)
      expect(memo).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'should have many memos' do
      assoc = Memo.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
