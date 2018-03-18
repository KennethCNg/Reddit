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
        inverse_of: :sub
    )

    has_many(
        :post_subs,
        primary_key: :id,
        foreign_key: :post_id,
        class_name: :PostSub,
        inverse_of: :sub,
        dependent: :destroy
    )

    has_many(
        :posts,
        through: :post_subs,
        source: :post
    )

end
