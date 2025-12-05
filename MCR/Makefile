# Archivo: Makefile

MAIN     := main.tex
OUTDIR   := build
JOB      := MCR

all: pdf

pdf:
	latexmk -pdf $(MAIN) -output-directory=$(OUTDIR) -f --jobname=$(JOB)

clean:
	latexmk -C -output-directory=$(OUTDIR) --jobname=$(JOB)

# Limpieza total (incluye PDFs)
cleanall:
	rm -rf $(OUTDIR)

# Compilación continua (muy cómodo)
watch:
	latexmk -pdf -pvc $(MAIN) -output-directory=$(OUTDIR) --jobname=$(JOB)

