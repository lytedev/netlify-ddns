# netlify-ddns

A stupid-simple, "fake dynamic DNS" script that integrates with Netlify via
their [provided API][netlify-api].

## Dependencies

+ bash
+ curl
+ jq

## Usage

Just run `make` to configure (if your first time) and run.

If you want this to run recurring every 5 minutes, setup a systemd timer for the
current user with `make install-user-timer`. You can revert this by running
`make uninstall-user-timer`.
