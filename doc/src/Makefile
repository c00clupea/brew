buildBrew:
	make SearchController.java
	make search.jsp
	make README
SearchController.java: userguide.nw
	notangle -t8 -R"SearchController.java" \
	userguide.nw > SearchController.java
search.jsp: userguide.nw
	notangle -t8 -R"search.jsp" \
	userguide.nw > search.jsp

README: userguide.nw
	notangle -t8 -R"README" \
	userguide.nw > README

upload: userguide.nw
	scp -P 3022 README muse@127.0.0.1:/home/muse/userguide
	scp -P 3022 userguide.pdf muse@127.0.0.1:/home/muse/userguide
	scp -P 3022 Makefile muse@127.0.0.1:/home/muse/userguide
	scp -P 3022 userguide.html muse@127.0.0.1:/home/muse/userguide
	
edituserguide:
		vim userguide.nw
cycle:
		make Makefile
		make buildBrew
		make userguide.tex
		make userguide.html
		make userguide.pdf
		make copydoc
userguide.tex: userguide.nw
		noweave -x -n -delay \
		-latex userguide.nw > userguide.tex 
userguide.html: userguide.nw
		noweave -filter l2h -index \
		-html userguide.nw | htmltoc > userguide.html
userguide.pdf: userguide.tex
		pdflatex userguide.tex
		#bibtex userguide.tex
		pdflatex userguide.tex
		pdflatex userguide.tex
Makefile: userguide.nw
		notangle -t8 -R"MakefileGuide" userguide.nw > MakefileGuide
		notangle -t8 -R"MakefileBrew" userguide.nw > MakefileBrew
		mv MakefileGuide Makefile
		mv MakefileBrew ../../makefile
copydoc:
		cp userguide.pdf ../
		cp README ../	
