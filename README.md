# Element

Element (formerly known as Vector and Riot) is a Matrix web client built using the [Matrix React SDK](https://github.com/matrix-org/matrix-react-sdk).

wikipedia.org/wiki/Element_(software)

<img src="https://camo.githubusercontent.com/f3021a33df97c21e30e9b8cf0e41760990f675605b31d1e3578da0a3238d5c60/68747470733a2f2f692e6962622e636f2f703146593336592f656c656d656e742d7765622e706e67" width="30%" height="auto" alt="Element logo">

## How to use this Makejail

You can use [Virtual Networks](https://appjail.readthedocs.io/en/latest/networking/virtual-networks/intro/#default-virtual-network-recommended), but Element Web requires a secure context, so you'll need to configure TLS. The easiest way to deploy Element Web is to [inherit the host's network stack](https://appjail.readthedocs.io/en/latest/networking/ip-inherit/) and listen on `localhost:80`.

```console
$ appjail oci run -Pd \
    -o overwrite=force \
    -o alias \
    -o ip4_inherit \
    -o ip6_inherit \
    ghcr.io/appjail-makejails/element-web element-web
```

To supply your own custom `config.json`, map a volume to `/usr/local/www/element/config.json`. For example, if your custom config was located at `/path/to/element-web/config.json` then your AppJail command would be:

```console
$ appjail oci run -Pd \
    -o overwrite=force \
    -o alias \
    -o ip4_inherit \
    -o ip6_inherit \
    -o fstab="/path/to/element-web/config.json usr/local/www/element/config.json" \
    ghcr.io/appjail-makejails/element-web element-web
```

### Arguments (stage: build)

* `element-web_from` (default: `ghcr.io/appjail-makejails/element-web`): Location of OCI image. See also [OCI Configuration](#oci-configuration).
* `element-web_tag` (default: `latest`): OCI image tag. See also [OCI Configuration](#oci-configuration).

### Environment (OCI image)

* `ELEMENT_WEB_HOST` (default: `localhost`): Name of the virtual server. See [server_name](https://nginx.org/en/docs/http/ngx_http_core_module.html#server_name) for details.
* `ELEMENT_WEB_PORT` (default: `80`): Specifies the source port NGINX should use.
* `PGID` (default: `1000`): Equivalent to `PUID` but for the Process Group ID.
* `PUID` (default: `1000`): Process User ID for the container's main process, allowing you to match the owner of files written to mounted host volumes to your host system's user. Writable volumes are changed based on this environment variable.

## OCI Configuration

```yaml
build:
  variants:
    - tag: 15.1
      containerfile: Containerfile
      aliases: ["latest"]
      default: true
      args:
        FREEBSD_RELEASE: "15.1"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
```
