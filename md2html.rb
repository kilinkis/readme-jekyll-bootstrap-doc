require 'nokogiri'
require 'redcarpet'
#require 'open-uri';

# open files
markdown = File.read('README.md')
#markdown = open("https://github.com/kilinkis/about-git/blob/master/README%20copy.md").read
html     = File.read('index.html')


doc = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new).render(markdown)

doc.prepend('<body>')
doc.concat("</body>")

doc.gsub! '<h1>', '</section><section class="bs-docs-section"><h1>'
doc.gsub! '<body></section>', ''
doc.gsub! '</body>', '</section>'

parsed = Nokogiri::HTML(doc)

#search each <h1> and replace with </section><section class="bs-docs-section"><h1>
#search <body></section> replace with <body>
#search </body> replace with </section></body>
#or use node[0]

#parsed.xpath('//h1') h1['id']= h1.inner_text.downcase.gsub(/\s+/, '-') h1['class']="page-header" end
parsed.xpath('//h1').each do |h1|
	#h1['id']= h1.inner_text.downcase.gsub(/\s+/, '-')
	h1['id']= h1.inner_text.downcase.gsub(/[^a-z ]/, '').gsub(/ /, '-')
	h1['class']="page-header"
end

parsed.xpath('//h2').each do |h| h['id']= h.inner_text.downcase.gsub(/[^a-z ]/, '').gsub(/ /, '-') end
parsed.xpath('//h3').each do |h| h['id']= h.inner_text.downcase.gsub(/[^a-z ]/, '').gsub(/ /, '-') end

temp = parsed.inner_html

temp.gsub! '<html><body>', ''
temp.gsub! '</body></html>', ''

html = File.read('index.html')

# search and replace
new_contents = html.gsub(/RENDERED_CONTENT/, temp)

File.write('index.html', new_contents)

puts 'All done!'

