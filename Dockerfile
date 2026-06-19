FROM fedora:32

# Fix EOL mirrors for Fedora 32 (archive)
RUN echo "fastestmirror=0" >> /etc/dnf/dnf.conf && \
    echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf && \
    sed -i 's/metalink/#metalink/g' /etc/yum.repos.d/fedora.repo && \
    sed -i 's/#baseurl/baseurl/g' /etc/yum.repos.d/fedora.repo && \
    sed -i 's|download.example/pub/fedora/linux|archives.fedoraproject.org/pub/archive/fedora/linux|g' /etc/yum.repos.d/fedora.repo && \
    sed -i 's/metalink/#metalink/g' /etc/yum.repos.d/fedora-updates.repo && \
    sed -i 's/#baseurl/baseurl/g' /etc/yum.repos.d/fedora-updates.repo && \
    sed -i 's|download.example/pub/fedora/linux|archives.fedoraproject.org/pub/archive/fedora/linux|g' /etc/yum.repos.d/fedora-updates.repo

# Install TeX Live collections + extras needed for altacv.cls (fontawesome5 icons, tcolorbox, etc.)
RUN dnf update -y && dnf install -y \
    texlive-collection-latexrecommended \
    texlive-collection-fontsrecommended \
    texlive-collection-fontsextra \
    texlive-collection-pictures \
    texlive-collection-science \
    texlive-collection-langcyrillic \
    texlive-collection-latexextra \
    && dnf clean all

WORKDIR /app
COPY . /app/

# Compile from CV/ directory where main.tex, altacv.cls and images are located.
# Run pdflatex twice to resolve references and layout properly.
CMD cd /app/CV && \
    pdflatex -interaction=nonstopmode main.tex && \
    pdflatex -interaction=nonstopmode main.tex
