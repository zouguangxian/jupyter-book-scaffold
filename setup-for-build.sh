#!/bin/bash
TEXLIVE_FONT_CONFIG=`kpsewhich -var-value TEXMFSYSVAR`/fonts/conf/texlive-fontconfig.conf
FONT_CONFIG=/etc/fonts/conf.d/09-texlive.conf

apt-get -y install --no-install-recommends ca-certificates \
  python3 python-is-python3 python3-pip \
  imagemagick \
  fonts-noto fonts-noto-mono fonts-noto-extra fonts-noto-cjk fonts-noto-cjk-extra \
&& ( [[ ! -f "$FONT_CONFIG" ]] && ln -s $TEXLIVE_FONT_CONFIG $FONT_CONFIG || true ) \
&& fc-cache -fsv \
&& pip3 install --prefer-binary --upgrade jupyter-book cookiecutter ghp-import matplotlib numpy pandas folium
