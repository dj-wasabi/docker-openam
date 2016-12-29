# docker-openam

![Docker Stars](https://img.shields.io/docker/stars/wdijkerman/openam.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/wdijkerman/openam.svg) [![](https://images.microbadger.com/badges/version/wdijkerman/openam.svg)](http://microbadger.com/images/wdijkerman/openam "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/wdijkerman/openam.svg)](http://microbadger.com/images/wdijkerman/openam "Get your own image badge on microbadger.com") [![Build Status](https://travis-ci.org/dj-wasabi/docker-openam.svg?branch=master)](https://travis-ci.org/dj-wasabi/docker-openam) 

This container is running a Java 8 with Tomcat 8 for OpenAM. This container is used for testing/validating the 'python-openam' module. This module can be found here: https://github.com/dj-wasabi/python-openam

This container has 2 tags:
* 12.0.0
* 13.0.0

There is no 13.5.0 tag yet.

# Usage

Using the container can be done like this:

```
docker pull wdijkerman/openam:13.0.0
docker run -d -h openam.example.com --name openam -p 8080:8080 wdijkerman/openam:13.0.0
```

This will bootup the container and start OpenAM. You'll have to make sure you put `openam.example.com` in your hosts file, otherwise you can't access OpenAM.
Check the logs to see when the container is booted correctly:
```
docker logs -f openam
```
Output will be like:
```
Registering service amAuthSAML2.xml...Success.
Registering service audit.xml...Success.
Registering service RadiusServerService.xml...Success.
Registering service amSessionPropertyWhitelist.xml...Success.
Registering service selfService.xml...Success.
Configuring system....Done
Configuring server instance....Done
Creating demo user....Done
Setting up monitoring authentication file.
Configuration complete!
```

Configuration is complete and you should be able to open the login page by opening the following url:
```
http://openam.example.com/openam
```

# Version

You can verify which OpenAM is running by opening the following url:
```
$ curl 'http://openam.example.com:8080/version'
13
```

# Credentials

The following credentials can be used:

## OpenDJ

```
Username: cn=Directory Manager
Password: password_opendj
```

## OpenAM

```
Username: amadmin
Password: password_openam
```

**note:**
This container is not suitable for production environments, there are no volumes for storing data and an "embedded" OpenDJ is used.
