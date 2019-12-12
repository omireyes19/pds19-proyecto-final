curl 'https://datasets.imdbws.com/title.principals.tsv.gz' -H 'authority: datasets.imdbws.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,/;q=0.8,application/signed-exchange;v=b3' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: navigate' -H 'referer: https://datasets.imdbws.com/' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: es-419,es;q=0.9' --compressed --output title.principals.tsv.gz
curl 'https://datasets.imdbws.com/name.basics.tsv.gz' -H 'authority: datasets.imdbws.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,/;q=0.8,application/signed-exchange;v=b3' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: navigate' -H 'referer: https://datasets.imdbws.com/' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: es-419,es;q=0.9' --compressed --output name.basics.tsv.gz
curl 'https://datasets.imdbws.com/title.basics.tsv.gz' -H 'authority: datasets.imdbws.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,/;q=0.8,application/signed-exchange;v=b3' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: navigate' -H 'referer: https://datasets.imdbws.com/' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: es-419,es;q=0.9' --compressed --output title.basics.tsv.gz
curl 'https://datasets.imdbws.com/title.crew.tsv.gz' -H 'authority: datasets.imdbws.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,/;q=0.8,application/signed-exchange;v=b3' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: navigate' -H 'referer: https://datasets.imdbws.com/' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: es-419,es;q=0.9' --compressed --output title.crew.tsv.gz
curl 'https://datasets.imdbws.com/title.ratings.tsv.gz' -H 'authority: datasets.imdbws.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,/;q=0.8,application/signed-exchange;v=b3' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: navigate' -H 'referer: https://datasets.imdbws.com/' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: es-419,es;q=0.9' --compressed --output title.ratings.tsv.gz
curl 'https://datasets.imdbws.com/title.akas.tsv.gz' -H 'authority: datasets.imdbws.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,/;q=0.8,application/signed-exchange;v=b3' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: navigate' -H 'referer: https://datasets.imdbws.com/' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: es-419,es;q=0.9' --compressed --output title.akas.tsv.gz
curl 'https://datasets.imdbws.com/title.episode.tsv.gz' -H 'authority: datasets.imdbws.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,/;q=0.8,application/signed-exchange;v=b3' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: navigate' -H 'referer: https://datasets.imdbws.com/' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: es-419,es;q=0.9' --compressed --output title.episode.tsv.gz
gunzip title.ratings.tsv.gz 
gunzip name.basics.tsv.gz
gunzip title.basics.tsv.gz
gunzip title.episode.tsv.gz
gunzip title.akas.tsv.gz
gunzip title.crew.tsv.gz
gunzip title.principals.tsv.gz
split -n 2 title.akas.tsv title.akas --additional-suffix=.tsv
head -n -1 title.akasaa.tsv > title.akas1.tsv 
rm title.akasaa.tsv
tail -n +2 title.akasab.tsv > title.akas2.tsv
rm title.akasab.tsv
rm title.akas.tsv
split -n 4 title.principals.tsv title.principals --additional-suffix=.tsv
head -n -1 title.principalsaa.tsv > title.principals1.tsv 
rm title.principalsaa.tsv
tail -n +2 title.principalsab.tsv | head -n -1 > title.principals2.tsv
rm title.principalsab.tsv
tail -n +2 title.principalsac.tsv | head -n -1 > title.principals3.tsv
rm title.principalsac.tsv
tail -n +2 title.principalsad.tsv > title.principals4.tsv
rm title.principalsad.tsv
rm title.principals.tsv
