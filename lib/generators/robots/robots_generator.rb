class RobotsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def add_route
    gsub_file 'config/routes.rb', "end", "  get 'robots.:format', to: 'robot#show'\nend"
  end

  def add_view
    copy_file "robots.text.erb", "app/views/robot/robots.text.erb"
    
    gsub_file "app/views/robot/robots.text.erb", "## ROOT_URL ##", "http://__ROOT_URL__"
  end

  def add_controller
    copy_file "robot_controller.rb", "app/controllers/robot_controller.rb"
  end

  def remove_original_robots_file
    remove_file "public/robots.txt"
  end

  def append_to_readme
    append_file 'README.md', "\n* update views/robot/robots.text.erb to use static root url\n"
  end

end