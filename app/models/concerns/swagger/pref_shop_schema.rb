module Swagger::PrefShopSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
   swagger_schema :PrefShopOutput do
      key :required, [:pref_id, :pref_name, :shop_count]
      property :pref_id do
        key :type, :integer
        key :format, :int64
      end
      property :pref_name do
        key :type, :string
      end
      property :shop_count do
        key :type, :integer
        key :format, :int64
      end
    end
  end
end
