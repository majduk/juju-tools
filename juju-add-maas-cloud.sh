#!/usr/bin/env bash

export http_proxy=http://100.107.0.4:1080/
export https_proxy=http://100.107.0.4:1080/
export no_proxy=$(echo 100.107.0.{2..255} | sed 's/ /,/g')

cat > /tmp/clouds.yaml <<EOF
clouds:
   maas:
      type: maas
      auth-types: [oauth1]
      endpoint: http://100.107.0.31/MAAS
EOF

cat > /tmp/credentials.yaml <<EOF
credentials:
     maas:
        dtadmin:
          auth-type: oauth1
          maas-oauth: $( cat ~/cfe/maas-api  )
EOF

juju add-cloud --replace maas /tmp/clouds.yaml
juju add-credential --replace maas -f /tmp/credentials.yaml
