# maxmind updater

> updates [legacy Maxmind geoip databases](https://dev.maxmind.com/geoip/legacy/downloadable/)

## usage

```sh
$ docker build -t meetup/maxmind-updater .
```

This image is expected with code mounted to a workdir, as Github Actions does, with
two environment varibles: `DATA_DIR` the directory to locate `GeoIPCity.dat`, and `CONF_DIR` to location `GeoIp.conf`. These both default to `data` and `conf` respectively.


```sh
$ docker run --rm \
	-v $(pwd):/code \
	-w /code \
	-e DATA_DIR:path/to/data \
	-e CONF_DIR:path/to/conf \
	meetup/maxmind-updater          
👍 GeoIP Database up to date, no action needed.
```

## references

* [geoipupdate tool](https://github.com/maxmind/geoipupdate-legacy)