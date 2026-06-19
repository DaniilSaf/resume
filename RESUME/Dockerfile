FROM ubuntu:latest

# Install LaTeX and required packages
RUN apt-get update && apt-get install -y \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-xetex \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# Compile the resume (adjust the source file name as needed)
CMD pdflatex -interaction=nonstopmode resume.tex && \
    pdflatex -interaction=nonstopmode resume.tex
