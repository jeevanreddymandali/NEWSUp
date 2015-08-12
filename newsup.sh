#!/bin/bash

USERNAME=$(whoami)

wget -q https://www.dropbox.com/s/c7sc9rapd7rmdaz/newsup_logo.jpeg?dl=0 -P /home/$USERNAME/

news() {
action=$(yad --width 400 --height 200 --title="news in shorts" --image="/home/$USERNAME/newsup_logo.jpeg?dl=0" --center --buttons-layout=spread --licon=/home/$USERNAME/NEWSUp_1.0/images.jpeg --text-align=fill \
--form --item-separator="," \
--field="Channel":CB \
--field="NEWS Type":CB \
--button=$"Get NEWS:2" \
--button=$"Enough NEWS For Now:3" \
"Latest Headlines,World,Entertainment,Science & Tech,Sports" "Fox,CNN,India Today")

newsret=$?
echo "news return is" $newsret

echo $action >> /home/$USERNAME/yad.txt

if [ $newsret -eq 252 ]
then
rm /home/$USERNAME/yad.txt
rm /home/$USERNAME/newsup_logo.jpeg?dl=0
exit 1

fi 

if [ $newsret -eq 3 ]
then
rm /home/$USERNAME/yad.txt
rm /home/$USERNAME/newsup_logo.jpeg?dl=0
exit 1

fi 

if [ $newsret -eq 2 ]
    then
        newstype=$(cut -d '|' -f1 /home/$USERNAME/yad.txt)
        echo "from cut"
        echo $channel
        channel=$(cut -d '|' -f2 /home/$USERNAME/yad.txt)
        echo $newstype

        case $newstype in
            Latest*) 
            echo "in case"
             if [ "$channel" == "India Today" ]

        then 
            echo "getting feed fox Ind tod headlines"
            getfeedlatestheadlinesit
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi 
    if [ "$channel" == "Fox" ]

        then 
            echo "getting feed fox lat headlines"
            getfeedlatestheadlinesfox
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi  
     if [ "$channel" == "CNN" ]

        then 
            echo "getting feed CNN lat headlines"
            getfeedlatestheadlinescnn
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi  
   ;;
   
            World*) 
            echo "in case"
                   if [ "$channel" == "India Today" ]

        then 
            echo "getting feed fox Ind tod world"
            getfeedworldit
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi 
    if [ "$channel" == "Fox" ]

        then 
            echo "getting feed fox lat headlines"
            getfeedlatestheadlinesfox
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi  
     if [ "$channel" == "CNN" ]

        then 
            echo "getting feed CNN lat headlines"
            getfeedlatestheadlinescnn
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi  
   ;;
   
               Enter*) 
            echo "in case"
            if [ "$channel" == "India Today" ]

        then 
            echo "getting feed fox Ind tod world"
            getfeedentertainmentit
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi 
    if [ "$channel" == "Fox" ]

        then 
            echo "getting feed fox lat headlines"
            getfeedentertainmentfox
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi  
     if [ "$channel" == "CNN" ]

        then 
            echo "getting feed CNN lat headlines"
            getfeedentertainmentcnn
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi  
   ;;
   
   Science*) 
            echo "in case"
            if [ "$channel" == "India Today" ]

        then 
            echo "getting feed fox Ind tod headlines"
            getfeedscitechit
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi 
    if [ "$channel" == "Fox" ]

        then 
            echo "getting feed fox lat headlines"
            getfeedscitechfox
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi  
     if [ "$channel" == "CNN" ]

        then 
            echo "getting feed CNN lat headlines"
            getfeedscitechcnn
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi  
   ;;
   
      Sports*) 
            echo "in case"
                if [ "$channel" == "India Today" ]

        then 
            echo "getting feed fox Ind tod headlines"
            getfeedsportsit
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi 
    if [ "$channel" == "Fox" ]

        then 
            echo "getting feed fox lat headlines"
            getfeedsportsfox
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi  
     if [ "$channel" == "CNN" ]

        then 
            echo "getting feed CNN lat headlines"
            getfeedsportscnn
            ret=$?
   
            if [ $ret -eq 10 ] 
                then
                    echo "new s 2"
                    rm /home/$USERNAME/yad.txt
                    unset channel
                    news
            fi
   fi  
   ;;
   
   esac
   
fi
}
getfeedlatestheadlinesit()
{
 rsstail -u timesofindia.indiatimes.com/rssfeedstopstories.cms -u timesofindia.indiatimes.com/rssfeeds/1221656.cms -d -l -p -n 20 -1 -i 10 -H | yad --text-info --show-uri --width=2000 --height=500 --title="NEWS UPDATES"
 return 10
}
getfeedworldit()
{
 rsstail -u timesofindia.indiatimes.com/rssfeeds/296589292.cms -d -l -p -n 20 -1 -i 10 -H | yad --text-info --show-uri --width=2000 --height=500
 return 10
}
getfeedentertainmentit()
{
rsstail -u timesofindia.indiatimes.com/rssfeeds/1081479906.cms -d -l -p -n 20 -1 -i 10 -H  | yad --text-info  --show-uri --width=2000 --height=500
 return 10
}
getfeedscitechfox()
{
 rsstail -u http://feeds.foxnews.com/foxnews/scitech -d -l -p -n 20 -1 -i 10 -H  | yad --text-info  --show-uri --width=2000 --height=500
 return 10
}
getfeedscitechit()
{
 rsstail -u timesofindia.indiatimes.com/rssfeeds/-2128672765.cms -u timesofindia.indiatimes.com/rssfeeds/5880659.cms -d -l -p -n 20 -1 -i 10 -H  | yad --text-info  --show-uri --width=2000 --height=500
 return 10
}
getfeedsportsit()
{
 rsstail -u timesofindia.indiatimes.com/rssfeeds/4719148.cms -u timesofindia.indiatimes.com/rssfeeds/4719161.cms -d -l -p -n 20 -1 -i 10 -H  | yad --text-info  --show-uri --width=2000 --height=500
 return 10
}
getfeedlatestheadlinesfox()
{
 rsstail -u http://feeds.foxnews.com/foxnews/latest -d -l -p -n 20 -1 -i 10 -H  | yad --text-info  --show-uri --width=2000 --height=500
 return 10
}
getfeedlatestheadlinescnn()
{
 rsstail -u http://rss.cnn.com/rss/edition.rss -d -l -p -n 20 -1 -i 10 -H  | yad --text-info  --show-uri --width=2000 --height=500
 return 10
}
getfeedworldfox()
{
 rsstail -u http://feeds.foxnews.com/foxnews/world -u http://feeds.foxnews.com/foxnews/politics -d -l -p -n 20 -1 -i 10 -H  | yad --text-info  --show-uri --width=2000 --height=500
 return 10
}
getfeedworldcnn()
{
 rsstail -u http://rss.cnn.com/rss/edition_world.rss -u http://rss.cnn.com/rss/money_news_international.rss -u http://rss.cnn.com/rss/edition_africa.rss -u http://rss.cnn.com/rss/edition_americas.rss -u http://rss.cnn.com/rss/edition_asia.rss -u http://rss.cnn.com/rss/edition_europe.rss -u http://rss.cnn.com/rss/edition_meast.rss -u http://rss.cnn.com/rss/edition_us.rss -d -l -p -n 20 -1 -i 10 -H  | yad --text-info  --show-uri --width=2000 --height=500
 return 10
}
getfeedentertainmentfox()
{
 rsstail -u http://feeds.foxnews.com/foxnews/entertainment -d -l -p -n 20 -1 -i 10 -H  | yad --text-info --show-uri  --width=2000 --height=500
 return 10
}
getfeedentertainmentcnn()
{
 rsstail -u http://rss.cnn.com/rss/edition_entertainment.rss -d -l -p -n 20 -1 -i 10 -H  | yad --text-info  --show-uri --width=2000 --height=500
 return 10
}
getfeedscitechfox()
{
 rsstail -u http://feeds.foxnews.com/foxnews/scitech -d -l -p -n 20 -1 -i 10 -H  | yad --text-info  --show-uri --width=2000 --height=500
 return 10
}
getfeedscitechcnn()
{
 rsstail -u http://rss.cnn.com/rss/edition_technology.rss -u http://rss.cnn.com/rss/edition_space.rss -d -l -p -n 20 -1 -i 10 -H  | yad --text-info  --show-uri --width=2000 --height=500
 return 10
}
getfeedsportsfox()
{
 rsstail -u http://feeds.foxnews.com/foxnews/sports -d -l -p -n 20 -1 -i 10 -H  | yad --text-info  --show-uri --width=2000 --height=500
 return 10
}
getfeedsportscnn()
{
 rsstail -u http://rss.cnn.com/rss/edition_sport.rss -u http://rss.cnn.com/rss/edition_football.rss -u http://rss.cnn.com/rss/edition_motorsport.rss -u http://rss.cnn.com/rss/edition_tennis.rss -d -l -p -n 20 -1 -i 10 -H  | yad --text-info  --show-uri --width=2000 --height=500
 return 10
}

echo "calling news 1"

news




rm /home/$USERNAME/yad.txt
