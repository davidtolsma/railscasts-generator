class SitemapGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def add_route
    gsub_file 'config/routes.rb', "end", "  get '/sitemap.:format', to: 'sitemap#show'\nend"
  end

  def add_controller
    copy_file "sitemap_controller.rb", "app/controllers/sitemap_controller.rb"
  end

  def add_view
    copy_file "show.xml.builder", "app/views/sitemap/show.xml.builder"
  end

  def append_to_readme
    append_file 'README.md', '* Update sitemap_controller.rb and views/sitemap/show.xml.builder'
  end

end
