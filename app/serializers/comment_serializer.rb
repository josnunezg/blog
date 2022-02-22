class CommentSerializer < Comments::CreatedSerializer
  belongs_to :user, serializer: Users::PreviewSerializer
end
