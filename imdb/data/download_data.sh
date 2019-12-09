wget -i data_imdb.txt
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
