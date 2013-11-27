# this procudes the <?xml ... ?> tag at the start of the document
#   note: this is different to calling builder normally as the <?xml?> tag
#         is very different to how you'd write a normal tag!
xml.instruct! :xml, :version => '1.0', :encoding => 'UTF-8'

# create the urlset
xml.urlset :xmlns => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  @products.each do |product|
    xml.url do 
      xml.loc "#{root_url}#{product}"
      xml.lastmod Time.now.strftime('%Y-%m-%d')
      xml.changefreq "weekly"
      xml.priority "1"
    end
  end

  # example static page
  #%w[about contact].each do |page|
  #    xml.url do
  #    xml.loc "#{root_url}#{page}"
  #    xml.lastmod Time.now.strftime('%Y-%m-%d')
  #    xml.changefreq "yearly"
  #    xml.priority "0.1"
  #  end
  #end
end