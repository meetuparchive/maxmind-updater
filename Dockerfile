FROM ubuntu:18.04

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		software-properties-common \
		sudo \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
	
RUN sudo add-apt-repository ppa:maxmind/ppa 

# https://github.com/maxmind/geoipupdate-legacy#installing-on-ubuntu
# https://github.com/maxmind/geoip-api-c#installation
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		build-essential \
		geoipupdate \
		libgeoip1 \
		libgeoip-dev \
		geoip-bin \
		python \
		python-dev \
		python-pip \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
	
# https://github.com/maxmind/geoip-api-python#installation
RUN pip install --upgrade setuptools && pip install GeoIP
	
COPY entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]