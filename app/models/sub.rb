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

class Sub < ApplicationRecord
    validates :name, :moderator_id, presence: true
    validates :name, uniqueness: true

    belongs_to(
        :moderator,
        primary_key: :id,
        foreign_key: :moderator_id,
        class_name: :User,
    )

    has_many(
        :posts,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :Post,
        inverse_of: :sub,
    )

end
