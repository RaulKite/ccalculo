daemonize
pidfile 'tmp/pids/puma.pid'
bind 'unix:///tmp/ccalculo.sock'
preload_app!
