class GeocodingSerializer
  include JSONAPI::Serializer
  attributes :lat, :lng
end
