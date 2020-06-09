# Dockerhub Build Trigger
This is a docker container image running a predefined job for triggering Dockerhub builds

## Installation

## Environment Variables
| Variable | Description |
| :--- | :--- |
| TRIGGER_URI | Your Dockerhub Trigger Uri URL|
| CRONJOB_STRING | Cronjob string, check below for example |

### Cronjob String
```# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * 

1 8 * * * # to run build every day at 08 o clock
```

## Start Dockerhub Build Trigger container:
```sh
$ docker run -dt \
    --name dockerhub_builder \
    --hostname dockerhub_builder \
    -e TRIGGER_URI="https://hub.docker.com/api/build/v1/source/xxxxx/trigger/xxxx/call/" \
    -e CRONJOB_STRING="1 8 * * *" \
    -l com.centurylinklabs.watchtower.enable='true' \
    robostlund/dockerhub-build-trigger:latest
```