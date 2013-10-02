{% for package in 'salt-master','git','GitPython','vim' %}
salt-master-install-{{package}}:
  pkg.installed:
    - name: {{package}}
{%endfor%}


#upgrade-to-salt-17:
#  cmd.script:
#    - source: salt://salt/files/upgrade-salt-from-github.sh
#    - wait:
#      - pkg: salt-master

add-salt-vim-files:
  cmd.script:
    - source: salt://salt/files/install-salt-vim-files.sh

add-git-repos:
  file.managed:
    - name: /etc/salt/master.d/add-git-repos.conf
    - source: salt://salt/files/add-git-repos.conf
    - mkdirs: True
