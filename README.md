# maxmind updater

> updates [legacy Maxmind geoip databases](https://dev.maxmind.com/geoip/legacy/downloadable/)

## usage

```sh
$ docker build -t meetup/maxmind-updater .
```

* volume mount `/conf` to directory containing `GeoIp.conf` file
* volume mount `/data` to directory containing `GeoIPCity.dat` file

```sh
$ docker run --rm \
	-v /path/to/conf:/conf \
	-v /path/to/data:/data \
	meetup/maxmind-updater          
👍 GeoIP Database up to date, no action needed.
```

## references

* [geoipupdate tool](https://github.com/maxmind/geoipupdate-legacy)