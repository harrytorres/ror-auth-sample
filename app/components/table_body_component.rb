# frozen_string_literal: true

class TableBodyComponent < ViewComponent::Base
  def initialize(rows:, edit_path:)
    @rows = rows
    @edit_path = edit_path
  end

end
