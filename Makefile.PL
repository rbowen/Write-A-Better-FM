use ExtUtils::MakeMaker;


# Build makefile
WriteMakefile(
  NAME         => 'betterFM',
  VERSION_FROM => 'VERSION',                           # finds $VERSION
  AUTHOR       => 'Rich Bowen (rbowen@rcbowen.com)',
  ABSTRACT     => 'betterFM',
  'dist'       => {
      COMPRESS => 'zip',
      SUFFIX   => '.zip',
      ZIP      => 'zip',
      ZIPFLAGS => '-r',
      DIST_DEFAULT => 'zipdist',
  },
  'realclean'  => {
  	  FILES => 'betterFM.aux betterFM.idx betterFM.ilg betterFM.ind betterFM.log betterFM.toc betterFM.ps betterFM.ptc* betterFM.mtc* betterFM.bmt betterFM.maf'
  },

);

sub MY::postamble {
    '
dvi:
		latex betterFM.tex
		latex betterFM.tex
		latex betterFM.tex
		makeindex betterFM.idx
		latex betterFM.tex

pdf:
		make dvi
		dvipdf betterFM.dvi
		open betterFM.pdf

everything:
		make dvi
		dvipdf betterFM.dvi
		open betterFM.pdf

publish:
		echo " " >> betterFM.tex
		svn ci -m "version bump" 
		make dvi
		dvipdf betterFM.dvi
		scp betterFM.pdf malbec.rcbowen.com:/var/www/vhosts/rewrite.drbacchus

';
}

