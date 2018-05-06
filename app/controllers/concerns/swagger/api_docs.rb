module Swagger::ApiDocs
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_root do
      key :swagger, '2.0'
      info do
        key :version, '1.0.0'
        key :title, 'TKG'
        key :description, 'API for TKG'
      end
      key :basePath, '/'
      key :consumes, ['application/json']
      key :produces, ['application/json']

    end

    SWAGGERED_CLASSES = [
      PrefShop,
      PrefShopsController,
      self
    ].freeze
  end

  def root_json
    Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
