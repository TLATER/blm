bin_SCRIPTS = blm
CLEANFILES = $(bin_SCRIPTS)
EXTRA_DIST = $(srcdir)blm.in

do_subst = sed -e 's,[@]datadir[@],$(datadir),g'

blm: blm.in Makefile
	$(do_subst) < $(srcdir)/blm.in > blm
	chmod +x blm
