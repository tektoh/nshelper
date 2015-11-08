# == Schema Information
#
# Table name: presentations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#  user_id    :integer
#  title      :string
#  slug       :string
#  memo       :text
#
# Indexes
#
#  index_presentations_on_deleted_at  (deleted_at)
#  index_presentations_on_slug        (slug)
#  index_presentations_on_user_id     (user_id)
#

FactoryGirl.define do
  factory :presentation do
    
  end

end
