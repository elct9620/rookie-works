# frozen_string_literal: true

module HeadHelper
  def seo_tags
    display_meta_tags(
      site: t('site_name'),
      title: nil,
      description: nil,
      keywords: '設計,畢業,畢業專題,遊戲,動畫',
      og: seo_og_options,
      reverse: true
    )
  end

  def original_url
    url_for(only_path: false)
  end

  private

  def seo_og_options
    {
      title: :full_title,
      site_name: :site,
      description: :description,
      type: 'website',
      url: original_url
    }
  end
end
