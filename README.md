# docker-robotframework
Docker image with Robot framework and Selenium library based on Alpine Linux

## Run example
```
$ docker run -d -e TESTS_FOLDER=/tmp/tests -e REPORTS_FOLDER=/tmp/reports -v <your-reports-folder>:/tmp/reports -v <your-tests-folder>:/tmp/tests your-image-name
```

## Other info
Docker build downloads and install geckodriver. You can also use the selenium default FireFox driver by using the provided script (/firefox.py).
