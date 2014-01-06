install-salt-packages:
  pkg.installed:
    - names:
      - salt-master
      - git
      - GitPython
      - vim-enhanced

add-salt-vim-files:
  cmd.script:
    - source: salt://salt/files/install-salt-vim-files.sh

add-git-repos:
  file.managed:
    - name: /etc/salt/master.d/add-git-repos.conf
    - source: salt://salt/files/add-git-repos.conf
    - mkdirs: True
