# frozen_string_literal: true

class ContainerTableComponent < ViewComponent::Base
  def initialize(rows:, edit_path:)
    @rows = rows
    @edit_path = edit_path
  end 
end
