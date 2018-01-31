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

class Memo < ApplicationRecord
  belongs_to :user
  validates :title, :date, :text_body, presence: true
end
