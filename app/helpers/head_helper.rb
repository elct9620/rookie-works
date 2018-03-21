# frozen_string_literal: true

module HeadHelper
  def seo_tags
    capture do
      concat description_meta
      concat keyword_meta
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
    strip_tags((content_for(:page_description) || '')).truncate(75)
  end

  def keyword(keyword)
    content_for(:page_keyword, ",#{keyword}")
  end

  # TODO: Implement inside controller or using other helper implement
  def keyword_meta
    return if content_for(:page_keyword).blank?
    keywords = content_for(:page_keyword).split(',')
    meta :keyword, keywords[1..-1].join(',')
  end
end
