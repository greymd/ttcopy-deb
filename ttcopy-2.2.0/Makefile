# DESTDIR is defined in dh_auto_install
# Ref: https://www.debian.org/doc/manuals/maint-guide/modify.ja.html
BINDIR=$(DESTDIR)/usr/bin
LIBDIR=$(DESTDIR)/usr/lib
TTCOPY_DEST=ttcopy
TTPASTE_DEST=ttpaste
TTCP_DEST=ttcp
INSTALL?=/usr/bin/install
RM?=/bin/rm -f

all:
	@echo "Run 'make install' to install"

install:
	${INSTALL} -d ${BINDIR}
	${INSTALL} -m755 ${TTCOPY_DEST} ${BINDIR}
	${INSTALL} -d ${BINDIR}
	${INSTALL} -m755 ${TTPASTE_DEST} ${BINDIR}
	${INSTALL} -d ${LIBDIR}
	${INSTALL} -m644 ${TTCP_DEST} ${LIBDIR}

uninstall:
	${RM} ${BINDIR}/${TTCOPY_DEST}
	${RM} ${BINDIR}/${TTPASTE_DEST}
	${RM} ${LIBDIR}/${TTCP_DEST}

deinstall: uninstall
