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
  	  FILES => 'betterFM.aux betterFM.idx betterFM.ilg betterFM.ind betterFM.log betterFM.toc betterFM.ps betterFM.ptc* betterFM.mtc* betterFM.bmt betterFM.maf betterFM.dvi betterFM.pdf'
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

html:
		latex2html -split 3 -dir ../website/book betterFM.tex
		open ../website/book/index.html

everything:
		make dvi
		dvipdf betterFM.dvi
		open betterFM.pdf

';
}

