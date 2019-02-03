class CommentSerializer < ActiveModel::Serializer
  attributes :content, :quiz_id, :user_id
  belongs_to :quiz
  belongs_to :user

end
