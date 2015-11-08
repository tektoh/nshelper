# == Schema Information
#
# Table name: slides
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  deleted_at         :datetime
#  presentation_id    :integer
#  sequence           :integer
#  picture            :string
#  picture_processing :boolean          default(FALSE)
#  picture_tmp        :string
#  memo               :text
#
# Indexes
#
#  index_slides_on_deleted_at       (deleted_at)
#  index_slides_on_presentation_id  (presentation_id)
#

require 'rails_helper'

RSpec.describe Slide, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
