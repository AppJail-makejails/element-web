# Element (web)

Element (formerly known as Vector and Riot) is a Matrix web client built using the Matrix React SDK.

Element is officially supported on the web in modern versions of Chrome, Firefox, and Safari. Other browsers may work, however, official support is not provided. For accessing Element on an Android or iOS device, check out element-android and element-ios - element-web does not support mobile devices.

element.io

<img src="https://i.ibb.co/p1FY36Y/element-web.png" width="80%" height="auto">

## How to use this Makejail

```sh
appjail makejail \
    -j element-web \
    -f gh+AppJail-makejails/element-web \
    -o virtualnet=":<random> default" \
    -o nat \
    -o expose=80
```

### Arguments

* `element_tag` (default: `13.3`): See [#tags](#tags).
* `element_config` (optional): Element configuration file.
* `element_nginx_conf` (default: `files/nginx.conf`): NGINX configuration file.

## Tags

| Tag    | Arch    | Version        | Type   |
| ------ | ------- | -------------- | ------ |
| `13.3` | `amd64` | `13.3-RELEASE` | `thin` |
| `14.1` | `amd64` | `14.1-RELEASE` | `thin` |
