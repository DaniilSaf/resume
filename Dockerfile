FROM fedora:32

RUN dnf update -y && dnf install -y \
    texlive-collection-latexrecommended \
    texlive-collection-fontsrecommended \
    texlive-collection-pictures \
    texlive-collection-science \
    texlive-collection-langcyrillic \
    texlive-pdfx \
    texlive-fontawesome5 \
    texlive-latex-extra \
    texlive-fonts-extra \
    cm-super \
    && dnf clean all

WORKDIR /app
COPY CV/ ./CV/

CMD cd CV && pdflatex -interaction=nonstopmode main.tex
