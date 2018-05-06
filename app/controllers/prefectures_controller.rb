class PrefecturesController < ApplicationController
  def index
    @prefectures = Prefecture.all
  end

  def search
  end
end
