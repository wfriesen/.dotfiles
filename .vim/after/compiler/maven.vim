if !has('linux')
  CompilerSet makeprg=~/bin/windowswrappers/mvnpaths.sh\ -B\ $*
endif
