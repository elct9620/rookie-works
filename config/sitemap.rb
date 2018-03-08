# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://rookie.works'
SitemapGenerator::Sitemap.ping_search_engines if Rails.env.production?

SitemapGenerator::Sitemap.create do
  Project.find_each do |project|
    add project_path(project), lastmod: project.updated_at
  end
end
