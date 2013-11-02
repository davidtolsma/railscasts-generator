class ReadmeGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def change_readme
    remove_file "README.rdoc"
  end

  def copy_README_file
    copy_file "README.md", "README.md"
  end

end
