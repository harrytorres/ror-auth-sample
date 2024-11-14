# frozen_string_literal: true
class BookTableDataComponent < ViewComponent::Base
  include Turbo::FramesHelper
  with_collection_parameter :book
  
  def initialize(book:)
    @book = book
  end 

  def edit_path(resource)
    resource_name = resource.model_name.singular
    "/#{resource_name.pluralize}/#{resource.id}/edit"
  end
  
end
