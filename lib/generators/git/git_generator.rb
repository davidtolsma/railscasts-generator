class GitGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def create_inital_git
    run "git init ." 
    run "git add ." 
    run "git commit -m 'initial commit'"
  end
end
