###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
end

activate :directory_indexes

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  # get all pngs in the clients dir
  def client_logos
    sitemap.resources.find_all { |res| res.url[%r{^/img/clients/.+\.png$}] }
  end

  def services_section
    request.params.section if request.params.section?
  end

  # helper for generating apple touch icons
  def apple_touch_icon_tag(size, options = {})
    options = {
        :rel => "apple-touch-icon-precomposed",
        :sizes => "#{size}x#{size}",
    }.merge(options)
    favicon_tag("favicon/#{size}.png", options)
  end
end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

set :api_url, 'http://hyfn-api.herokuapp.com'

activate :livereload

class Middleman::Sitemap::Resource
  # eg /work/wendys.html -> work_wendys
  def page_name
    path = self.path
    path << settings.index_file if path.match(%r{/$})
    path.gsub(%r{^/}, '').split('.')[0].split('/').join("_")
  end
end

# Build-specific configuration
configure :build do

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster
  activate :asset_hash

  # activate :gzip
  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
  ignore "/img/icons/*.png"
end

# Enable syncing to S3 if the sync.yml file is included
if data.to_h.has_key?("sync")
  activate :sync do |sync|
    data.sync.each { |k,v| sync.send("#{k}=", v) }
  end
end

# Enable deploy via rsync if the deploy.yml file is included
if data.to_h.has_key?("deploy")
  activate :deploy do |deploy|
    data.deploy.each { |k,v| deploy.send("#{k}=", v) }
  end
end