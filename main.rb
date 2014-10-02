require 'nokogiri'
require 'ting'

character = Nokogiri::XML File.read('character.xml')
pinyin = Nokogiri::XML File.read('pinyin.xml')

print '<html><head><meta charset="UTF-8">'
puts '<style>'
puts '.word { background-color: yellow; margin: 2px; border-radius: 3px; display: inline-block; float: left; }'
puts '</style>'
print '</head><body>'
character.xpath('//p').zip(pinyin.xpath('//p')).each do |paragraph_character, paragraph_pinyin|
	print '<p>'
		paragraph_character.children.zip(paragraph_pinyin.children).each do |sentence_character, sentence_pinyin|
			print '<span class="sentence">'
				sentence_character.children.zip(sentence_pinyin.children).each do |word_character, word_pinyin|
					print "<span class=\"word\">"
					print "#{word_character.text}<br />"
					print "#{word_pinyin.text}"
					print "</span>"
				end
			print '</span>'
		end
	print '</p>'
end
print '</body></html>'
