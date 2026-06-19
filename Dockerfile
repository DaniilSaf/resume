FROM fedora:32

RUN dnf update -y && dnf install -y \
    texlive-scheme-full \
    texlive-collection-latexrecommended \
    texlive-collection-fontsrecommended \
    texlive-collection-pictures \
    texlive-collection-science \
    texlive-collection-langcyrillic \
    texlive-collection-langeuropean \
    texlive-collection-bibtexextra \
    texlive-collection-latex \
    texlive-pdfx \
    texlive-fontawesome5 \
    texlive-cbfonts \
    texlive-charter \
    texlive-helvetic \
    texlive-times \
    texlive-palatino \
    texlive-cmsuper \
    texlive-luatex \
    texlive-xetex \
    tex-gyre-fonts \
    dejavu-fonts \
    liberation-fonts \
    fira-fonts \
    google-noto-fonts \
    google-noto-sans-fonts \
    google-noto-serif-fonts \
    && dnf clean all

WORKDIR /app
COPY CV/ ./CV/

CMD cd CV && pdflatex -interaction=nonstopmode main.tex
