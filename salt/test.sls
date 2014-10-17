{% for service in 'dhcpd','sshd','httpd' %}
install-awesome-{{service}}:
  pkg:
    - installed
    - name: {{ service }}
  service:
    - running
    - enabled
    - name: {{ service }}
{% endfor %}


