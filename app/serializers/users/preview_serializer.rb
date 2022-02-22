module Users
  class PreviewSerializer < ActiveModel::Serializer
    attributes :id, :email, :full_name
  end
end
