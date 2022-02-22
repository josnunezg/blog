module Comments
  class CreatedSerializer < ActiveModel::Serializer
    attributes :id, :body, :created_at
  end
end
