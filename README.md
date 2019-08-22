# maxmind updater [![](https://github.com/meetup/maxmind-updater/workflows/Main/badge.svg)](https://github.com/meetup/maxmind-updater/actions)

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

### Github Actions

```yaml
name: GeoIp Update
on: push
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@master
        with:
          fetch-depth: 1
      - name: Test
        uses: docker://meetup/maxmind-updater:{docker-tag}
        env:
          DATA_DIR: path/to/data
          CONF_DIR: path/to/conf
      - name: Diff
        run: git status
```

## references

* [geoipupdate tool](https://github.com/maxmind/geoipupdate-legacy)