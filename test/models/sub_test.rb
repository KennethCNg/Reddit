# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  moderator_id :integer          not null
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class SubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
