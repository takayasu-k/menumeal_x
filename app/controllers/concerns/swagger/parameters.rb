module Swagger::Parameters
  def self.extended(base)
    base.parameter :prefecture_id do
      key :in, :path
      key :description, 'Prefecture ID'
      key :required, true
      key :type, :integer
      key :format, :int64
    end

  end
end
