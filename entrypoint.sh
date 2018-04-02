#!/bin/ash

# env > /go/env
# export $(cat /go/env | grep -v ^# | grep -v $DOMAIN | xargs)

run_server() {
  if [ -n "$DOMAIN" ]; then
    SERVER=https://${DOMAIN}
  elif [ -n "$MARATHON_APP_LABEL_HAPROXY_0_VHOST" ]; then
    SERVER=https://${MARATHON_APP_LABEL_HAPROXY_0_VHOST}
  else
    SERVER=http://localhost
  fi

  # build static site
  /go/bin/hugo

  # run hugo sever
  /go/bin/hugo server --theme=hestia-pure --bind="0.0.0.0" --baseUrl="${SERVER}/" --appendPort=false --port 80 --watch
}

create_new_page() {
  /go/bin/hugo new post/$1.md
}

subcommand="$1"
shift

page_name="$1"
shift

case $subcommand in
  new)
    create_new_page ${page_name} ;;
  *)
    run_server ;;
esac
