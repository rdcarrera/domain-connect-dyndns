# Container for domain-connect-dyndns

With this container you can create and update dyndns thanks to [domain-connect-dyndns](https://pypi.org/project/domain-connect-dyndns/).

## How it works

You **have to mount a** config **volume** to this container.

The default path for the config within the container is: **/config**

The container has two actions:

### setup

With this action you can create the domain-connect-dyndns's configuration,

You need to pass the domain name variable → DOMAIN

**This action is interactive,** because you've to pass the access token by cli.

**Example**:

```sh
docker run -it --rm --name dyndns-setup -v ~/config:/config -e DOMAIN=example.org -e PROTOCOLS='ipv4 ipv6' tobiaswild/domain-connect-dyndns setup
```

### update

With this action the container execute in loop the update option of the domain-connect-dyndns

This is the **default** action defined inside the Dockerfile.

**Example:**

```sh
docker run -d --name dyndns-setup -v ~/config:/config tobiaswild/domain-connect-dyndns
```

## Volumes

| name   | description                              |
| ------ | ---------------------------------------- |
| CONFIG | The volume where keep the settings file. |

## Env

| name        | required | default value | description                                           |
| ----------- | -------- | ------------- | ----------------------------------------------------- |
| CONFIG_PATH | false    | /config       | The config path inside the container.                 |
| CONFIG_FILE | false    | settings.txt  | The configuration file.                               |
| DOMAIN      | true     | null          | The domain to keep up to date.                        |
| PROTOCOLS   | false    | ipv4          | The protocols that should be used.                    |
| SLEEP_TIME  | false    | 120           | The time to wait between loop's iteration             |
| DOCKER_USER | false    | user          | The user within the container who execute the action. |
