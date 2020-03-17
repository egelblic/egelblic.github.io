# Yes, I did just use Make as a static site generator.

site: index.html about/about_this_site.html other_resources/other_resources.html other_resources/but_how_do_it_know.html hardware.html led_resistor.html logic_families/cmos.html hardware_techniques/component_selection.html about/about_the_creator.html about/license.html hardware_techniques/digital_to_electronic.html

firefox: site
	nohup firefox index.html

%.html: %.md include/header.html include/footer.html
	cat $< | pandoc --mathjax | cat include/header.html - include/footer.html > $@

clean:
	rm *.html