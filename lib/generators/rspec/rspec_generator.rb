class RspecGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def rspec
    gem "rspec-rails", group: [:test, :development]
    run "bundle install"
    generate "rspec:install"
  end
end
