class Rails4Generator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def binstubs
    #run "bundle exec rake rails:update:bin"
    #gsub_file '.gitignore', "/bin", "# /bin"
    
    if Rails::VERSION::STRING.to_i >= 4
      puts Rails::VERSION::STRING
    else
      puts "not 4"
    end


  end

end
