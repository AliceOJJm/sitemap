module Api
  class PageSerializer < ActiveModel::Serializer
    attributes :id, :link_name, :full_path, :children

    def children
      object.children.map { |page| PageSerializer.new(page) }
    end
  end
end
