export http_proxy=http://100.107.0.4:1080/
export https_proxy=http://100.107.0.4:1080/
export no_proxy=$(echo 100.107.0.{2..255} | sed 's/ /,/g')

juju deploy --debug $1
