daemonize
pidfile '/tmp/puma.pid'
bind 'unix:///tmp/ccalculo.sock'
preload_app!
