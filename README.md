# docker-openam

[![Build Status](https://travis-ci.org/dj-wasabi/docker-openam.svg?branch=master)](https://travis-ci.org/dj-wasabi/docker-openam)

This container is running a Java 8 with Tomcat 8 for OpenAM. This container is used for testing/validating the 'python-openam' module. This module can be found here: https://github.com/dj-wasabi/python-openam

This container has 2 tags:
* 12.0.0
* 13.0.0

There is no 13.5.0 tag yet.

You can verify which OpenAM is installed by opening the following url:
```
$ curl 'http://openam.example.com:8080/version'
13
```

Side note:
This container is not suitable for production environments, there are no volumes for storing data and an "embedded" OpenDJ is used.
