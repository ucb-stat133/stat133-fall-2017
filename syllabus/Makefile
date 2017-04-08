
all: calendar.html faqs.html


calendar.html: calendar.md
	pandoc -s calendar.md -o calendar.html


faqs.html: faqs.md
	pandoc -s faqs.md -o faqs.html


clean:
	rm -rf calendar.html faqs.html
