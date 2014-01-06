salt-api-prereqs:
  pkg.installed:
    - names:
      - python-pip
      - salt-master
      - pyOpenSSL
  service:
    - name: salt-master
    - running
    - enable: true

install-salt-api:
  pip.installed:
    - names:
      - salt-api
      - cherrypy
  # Configure CherryPy and Eauth
  file.managed:
    - name: /etc/salt/master.d/salt-api.conf
    - source: salt://salt/salt-api/salt-api.conf
  user.present:
    - name: saltuser
    - password: papAq5PwY/QQM  #'password'

# Restart to pick up the new configs
restart-salt-master:
  cmd.run:
    - name: /etc/init.d/salt-master restart

create-self-signed-cert:
  cmd.run:
    - name: salt-call --local tls.create_self_signed_cert

# salt-api doesn't come with init scripts so just 
# start it from the cli
start-salt-api:
  cmd.run:
    - name: salt-api

disable-firewall:
  service:
    - name: iptables
    - enable: false
    - dead

