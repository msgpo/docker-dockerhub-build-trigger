Image daily triggers a Docker image rebuild on Docker Hub.

It is configured through environment variables:
 * `TRIGGER_URI` – a token which you can obtain on *Build Settings* page on Docker Hub
   of your Docker image; at the end there is a section named *Build Triggers* where
   you have to first activate triggers
 * `CRONJOB_STRING` – TBA
