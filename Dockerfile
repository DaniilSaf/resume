FROM ubuntu:18.10
ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's/archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-extra \
    texlive-fonts-extra \
    dvipng \
    texlive-latex-recommended \
    texlive-base \
    texlive-pictures \
    texlive-lang-cyrillic \
    texlive-science \
    cm-super \
    texlive-generic-extra \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY CV/ ./CV/

CMD cd CV && pdflatex -interaction=nonstopmode cv.tex

