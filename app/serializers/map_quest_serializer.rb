class MapQuestSerializer
  include JSONAPI::Serializer
  attributes :code, :name, :type, :release_date, :block, :cards
end