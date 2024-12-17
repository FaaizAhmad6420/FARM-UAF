module Ransackable
  extend ActiveSupport::Concern

  class_methods do
    def ransackable_attributes(auth_object = nil)
      column_names
    end

    def ransackable_associations(auth_object = nil)
      column_names
    end
  end
end
