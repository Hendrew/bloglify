# frozen_string_literal: true

class ArticlesSerializer
  def self.collection_serialize(collection) = collection.map { object_serialize(it) }

  def self.object_serialize(object)
    {
      id: object.id,
      title: object.title,
      slug: object.slug,
      body: object.body,
      author: object.user.name,
      created_at: object.created_at
    }
  end
end
