FROM fedora:32

RUN echo "fastestmirror=0" >> /etc/dnf/dnf.conf && \
    echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf && \
    sed -i 's/metalink/#metalink/g' /etc/yum.repos.d/fedora.repo && \
    sed -i 's/#baseurl/baseurl/g' /etc/yum.repos.d/fedora.repo && \
    sed -i 's/download.example\/pub\/fedora\/linux/archives.fedoraproject.org\/pub\/archive\/fedora/g' /etc/yum.repos.d/fedora.repo && \
    sed -i 's/metalink/#metalink/g' /etc/yum.repos.d/fedora-updates.repo && \
    sed -i 's/#baseurl/baseurl/g' /etc/yum.repos.d/fedora-updates.repo && \
    sed -i 's/download.example\/pub\/fedora\/linux/archives.fedoraproject.org\/pub\/archive\/fedora/g' /etc/yum.repos.d/fedora-updates.repo

RUN dnf update -y && dnf install -y \
    texlive-collection-latexrecommended \
    texlive-collection-fontsrecommended \
    texlive-collection-pictures \
    texlive-collection-science \
    texlive-collection-langcyrillic \
    texlive-collection-latexextra \
    && dnf clean all

WORKDIR /app
COPY . /app/

CMD cd /app && pdflatex -interaction=nonstopmode main.tex

