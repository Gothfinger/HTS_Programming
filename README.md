### Prog1

Scuffed, but it works. Take the html source manually and put into script. <br />

1, First create the wordlist which contains pair-value keys. <br />
         --> A_parse_wordlist.sh<br />
         --> B_KeyValuePair.sh<br />
2, Use the Mainscript<br />

Can be cleaned up and made to look nicer into one single script probably


### Prog11

Since hackthissite is using a special cookie for each user-agent that tries to login it becomes complicated to use wget to login. This is done by most websites today requiring login. I.e it's not enough to simply send
__--post-data="username=$USER&password=$PASS&btn_submit=Login"__ but you must also send this cookie which is spawned uniquely each time you go to the webpage.

To see what data is expected go to Developer Tools in Firefox, then to the page you want to extract data from (__https://www.hackthissite.org/missions/prog/11/__).  Observe the cookie, in "Storage" tab, that already exists for you even though you are not logged in. This is the uniquely spawned hash for just your browser.
If you try and use wget you will get another unique code, which needs to be fetched and included what you post together with username & password. 

Now go to "Network" tab. Set Persist Logs. Click login in with your username & password. Check the first request and copy as cURL. 
Inspect the copied string, as you can see hackthissite also expect this unique cookie __HackThisSite=37m4279lh7immjeclfpd3s8g76__ together with all other information.

It's probably possible to somehow add this to wget but not sure how to, since you first have to visit the page - get the cookie - then parse it out and insert it into your next command where you visit again with the username & password.

**How I did it** <br />
1, Run extract_cookies.sh > cookies.txt (Make sure you have the same cookie in firefox as in this extracted file) <br />
2, Login in firefox to that specific page <br />
3, Run prog11.sh (http seems to work better than https) Try it a few times quickly after another since the 3 second timer might have gone over. <br />





