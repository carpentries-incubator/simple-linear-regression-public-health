Rscript -e "source(file.path('bin', 'dependencies.R')); install_required_packages(); install_dependencies(identify_dependencies())"
Rscript -e "install.packages('devtools'); devtools::install_github('jacob-long/jtools')"
