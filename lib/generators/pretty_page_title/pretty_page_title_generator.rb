class Pretty_page_titleGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def create_page_title

    inject_into_file 'app/helpers/application_helper.rb', before: "end\n" do <<-'RUBY'
      def title(page_title)
        content_for(:title) { page_title }
      end
    RUBY
    end

  end

  def application_layout
    # insert into  layout
    gsub_file 'app/views/layouts/application.html.erb', "</title>", "<title>#{file_name} - <%= yield(:title) %></title>"

  end


end