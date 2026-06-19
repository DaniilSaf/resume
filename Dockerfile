FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-pictures \
    texlive-lang-cyrillic \
    texlive-science \
    cm-super \
    texlive-generic-extra \
    texlive-generic-recommended \
    dvipng \
    && rm -rf /var/lib/apt/lists/*
COPY CV/ /CV/
WORKDIR /CV
CMD ["pdflatex", "-interaction=nonstopmode", "main.tex"]