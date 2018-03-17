# == Schema Information
#
# Table name: moderators
#
#  id         :integer          not null, primary key
#  mod_id     :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ModeratorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
