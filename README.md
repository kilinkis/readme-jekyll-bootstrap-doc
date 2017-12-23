Readme to Jekyll Bootstrap Doc
============================================================

Generate a static Bootstrap+Jekyll website based on a given Readme file.

Demo: https://kilinkis.github.io/readme-jekyll-bootstrap-doc/

Usage
---------------------------------

1. Clone repo
2. Replace readme.md file with yours
3. In the console, run: ruby md2html.rb (Install dependecies if needed [sudo gem install nokogiri redcarpet ])
4. Hydriate config.yml with your variables
5. Run jekyll: bundle exec jekyll serve
6. When ready to publish, compile jekyll: jekyll build
7. (optional) Upload to your server

FAQs
---------------------------------

Q: I updated my readme file and want to update my jekyll as well.

A: Just delete all the content after the </script> tag in index.html and start from step 3.

Q: After compiling, site/index.html won't load scripts and styles.

A: Three words: Not a bug. Jekyll is made like that on puropose. /site is ready to be uploaded and run in a server. For previewing, use localhost (as in step 5)

Q: How can I edit the footer?

A: Edit layouts/default.html


Credits
---------------------------------

This repo was forked from mistic100's: Jekyll Bootstrap Doc
