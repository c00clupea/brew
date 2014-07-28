filename := brew.tar.gz
appdir := app
docdir := doc
sources := ${appdir}/src
lib := ${appdir}/lib
webapps := ${appdir}/webapps
additionals := makefile ${appdir}/.project ${appdir}/.classpath
documentation := ${docdir}/userguide.pdf ${docdir}/README
actualfile = $(shell date)_${filename}
allFilesToTarGz := ${sources} ${lib} ${webapps} ${additionals} ${documentation}
redeploybrew:
		make deletebrew
		make extractbrew
deletebrew:
		rm -rvf ${appdir}
		rm -rvf ${docdir} 
extractbrew:
		tar -xzvf ${filename} 
packbrew:
		tar -czvf "${actualfile}" ${allFilesToTarGz}
packforcopy:
		tar -czvf ${filename} ${allFilesToTarGz}
