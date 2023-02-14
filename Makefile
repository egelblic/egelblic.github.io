# Yes, I did just use Make as a static site generator.

site: index.html 

firefox: site
	nohup firefox index.html

%.html: %.md include/header.html include/footer.html
	cat $< | pandoc --mathjax | cat include/header.html - include/footer.html > $@

clean:
	rm *.html