# Yes, I did just use Make as a static site generator.

site: index.html intro_components.html about_this_site.html other_resources.html

firefox: site
	nohup firefox index.html

%.html: %.md
	marked -i $< | cat include/header.html - include/footer.html > $@

clean:
	rm *.html