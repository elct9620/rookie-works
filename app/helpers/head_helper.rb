# frozen_string_literal: true

module HeadHelper
  def seo_tags
    capture do
      concat description_meta
    end
  end

  def meta(name, content, options = {})
    content_tag :meta, nil, options.merge(name: name, content: content)
  end

  def description_meta
    return if page_description.blank?
    meta :description, page_description
  end

  def page_description
    strip_tags((content_for(:page_description) || '')).truncate(150)
  end
end
