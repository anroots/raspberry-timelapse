# Raspberry Timelapse

Ansible playbook to configure a Raspberry Pi 3B with a USB camera to take pictures, periodically. Those pictures can be merged into a timelapse video.

It works as follows:

- Every minute, the Pi takes one picture and saves it to SD card
- Once a day, the PI transfers accumulated images to external NAS mount
- After X time, the operator combines the images into a movie

Highly opinionated, not really documented, meant for personal usage.

## Install

- Boot a fresh copy of latest Raspiab
- Configure Raspberry IP address in `hosts` file
- SSH into Raspberry, change root/pi user passwords, expand the filesystem
- Run this playbook from an external host like so:
```bash
DATADOG_API_KEY=secret NAS_IP=10.0.0.55 NAS_PASSWORD='secret' ansible-playbook -i hosts site.yml
```


## License

MIT
