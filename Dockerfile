FROM alpine:3.6

MAINTAINER blunkka

RUN apk add --update --no-cache \
    python \
    python-dev \
    py-pip \
    bash \
    firefox-esr \
    xvfb \
    dbus \
    ttf-freefont\
    openssl

RUN pip install -U \
    pip \
    robotframework \
    selenium \
    robotframework-selenium2library \
    robotframework-ftplibrary \
    robotframework-xvfb \
    robotframework-requests

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

#Download geckodriver for firefox.
#TODO SHA check
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.17.0/geckodriver-v0.17.0-linux32.tar.gz \
    && tar -zxvf geckodriver-v0.17.0-linux32.tar.gz \
    && mkdir drivers \
    && mv geckodriver /drivers/ \
    && rm -rf geckodriver-v0.17.0-linux32.tar.gz

ENV PATH /drivers/:$PATH

#To use selenium's default FireFox driver
#Set the firefox profile by calling firefox.py use_default_profile function within your tests.
COPY firefox.py /firefox.py
RUN chmod -x /firefox.py

ENTRYPOINT ["/entrypoint.sh"]
