class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :updated_at

  has_many :comments
  belongs_to :user, serializer: Users::PreviewSerializer
end
