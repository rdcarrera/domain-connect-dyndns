# Container for domain-connect-dyndns
With this container you can create and update dyndns thanks to [domain-connect-dyndns](https://pypi.org/project/domain-connect-dyndns/).

## HOW-WORKS
> You **have to mount a** config **volume** to this container.<br>
> The default path for the config within the container is: **/config**<br><br>
> The container has two actions:
>> **setup**:  With this action you can create the domain-connect-dyndns's configuration, <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You need to pass the domain name variable → DOMAIN<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**This action is interactive,** because you've to pass the access token by cli<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Example**:
```
docker run -it --rm --name dyndns-setup -v ~/config:config -e DOMAIN=example.org rdcarrera/domain-connect-dyndns setup
*** domain-connect-dyndns 0.0.9 ***

Please open
https://*********
and provide us the access code:
```
>> **update**: With this action the container execute in loop the update option of the domain-connect-dyndns<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This is the **default** action defined inside the Dockerfile.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Example:**
```
docker run -d --name dyndns-setup -v ~/config:config rdcarrera/domain-connect-dyndns
```

## VOLUMES
**- CONFIG:** The volume where keep the settings file.

## ENV

**- CONFIG_PATH** &nbsp;&nbsp;[Default value: **/config**] **:** The config path inside the container.<br>
**- CONFIG_FILE** &nbsp;&nbsp;&nbsp;&nbsp;[Default value: **settings.txt**] **:** The configuration file.<br>
**- DOMAIN** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Default value: null] **:** The domain to keep up to date.<br>
**- SLEEP_TIME** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Default value: **120**] **:** The time to wait between loop's iteration<br>
**- DOCKER_USER** &nbsp;[Default value: **user**] **:** The user within the container who execute the action.<br>