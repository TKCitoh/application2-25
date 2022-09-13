class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_action :authenticate_user!, except: [:top]
end
