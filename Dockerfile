FROM fedora:32

RUN dnf update -y && dnf install -y \
    texlive-collection-latexrecommended \
    texlive-collection-fontsrecommended \
    texlive-collection-pictures \
    texlive-collection-science \
    texlive-collection-langcyrillic \
    && dnf clean all

COPY CV /CV
WORKDIR /CV

CMD ["pdflatex", "-interaction=nonstopmode", "main.tex"]
