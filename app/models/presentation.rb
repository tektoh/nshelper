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

class Presentation < ActiveRecord::Base
  belongs_to :user

  has_many :slides, -> { order(:sequence) }, dependent: :destroy

  accepts_nested_attributes_for :slides, allow_destroy: true

  validates :title, presence: true

  scope :by_user, -> (user) { where(user: user) }

  before_save do
    self.slug = SecureRandom.uuid unless slug?
    self
  end

  def public_url(request)
    port = ":#{request.port}" unless [80, 443].include?(request.port)
    "#{request.protocol}#{request.host}#{port}/#{slug}"
  end
end
