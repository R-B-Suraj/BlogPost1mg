class Comment < ApplicationRecord
    belongs_to :blog
    belongs_to :user
    belongs_to :parent, class_name: 'Comment', optional: true 
    has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy


    validate :text, presence: true, length:{minimum:1, maximum:200}



end
