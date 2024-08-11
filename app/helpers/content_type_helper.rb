module ContentTypeHelper
  def render_content_type_tree(content_types)
    content_types.map do |content_type, sub_content_types|
      render(partial: 'content_type', locals: { content_type: content_type, sub_content_types: sub_content_types })
    end.join.html_safe
  end
end
