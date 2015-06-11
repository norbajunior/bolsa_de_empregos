module DefaultScope
  extend ActiveSupport::Concern

  included do
    default_scope { order(id: :desc) }
  end
end
