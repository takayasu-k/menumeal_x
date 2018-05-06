module Swagger::PrefShopsApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    include Swagger::ErrorSchema

    swagger_path '/pref_shops' do
      operation :get do
        key :description, 'Get all pref_shops'
        key :operationId, :get_pref_shop

        response 200 do
          key :description, 'All pref_shops'
          schema type: :array do
            items do
              key :'$ref', :PrefShopOutput
            end
          end
        end
      end
    end
  end
end
