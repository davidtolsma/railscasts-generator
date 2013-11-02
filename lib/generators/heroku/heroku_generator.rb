class HerokuGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def heroku
    # use thin webserver
    append_file "Gemfile", "\n\ngem 'thin', group: :production"

    # ADD ruby "2.0.0" to bottom of Gemfile on a new line
    append_file "Gemfile", "\n\nruby '2.0.0'\n"

    run "bundle install"

    run "heroku login"

    #Create heroku app with name provided
    heroku create file_name

    run 'rake rails:update:bin'

    run 'git add .'
    run 'git commit -m "Heroku deploy"'

    run "git push heroku master"

    run "heroku run rake db:migrate"

    run "heroku open"

    # Addons
    run "heroku addons:add redistogo"

    run "heroku addons:add pgbackups"

  end
end
