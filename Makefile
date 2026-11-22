BUILDDIR := build/
DISTDIR := dist/
NAME := ipvfoobarbaz
MANIFEST := src/manifest.json
VERSION := $(shell cat ${MANIFEST} | sed -n 's/^ *"version": *"\([0-9.]\+\)".*/\1/p' | head -n1)

all: chrome

chrome:
	mkdir -p ${DISTDIR} ${BUILDDIR}
	rm -f ${DISTDIR}${NAME}-${VERSION}.zip ${BUILDDIR}${NAME}-${VERSION}.zip
	(cd src && zip -9r ../${DISTDIR}${NAME}-${VERSION}.zip .)
	cp -f ${DISTDIR}${NAME}-${VERSION}.zip ${BUILDDIR}${NAME}-${VERSION}.zip

clean:
	rm -rf ${BUILDDIR} ${DISTDIR}
