# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  url          :string
#  content      :string
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
    validates: :title, :moderator_id, presence: true
    validates: :title, uniqueness: true

    belongs_to(
        :moderator,
        primary_key: :id,
        foreign_key: :moderator_id,
        class_name: :User
    )

    has_many(
        :posts,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :Post
    )

end
