class PostgresqlGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def add_postgres_to_production
    inject_into_file 'Gemfile', after: "gem 'sqlite3'\n" do <<-'RUBY'
gem 'pg', group: :production
    RUBY
    end
    gsub_file 'Gemfile', "gem 'sqlite3'", "gem 'sqlite3', group: [:test, :development]"
  end

end
