# Jupyter for UserLAnd on ChromeOS

As a Jupyter Notebook/Lab user and a Samsung Chromebook Pro owner I've spent a lot of time trying to figure out a method to use a local install of Jupyter without resorting to the Developer Mode. I've put a lot of time into fighting with Termux (which is a great platform), experimenting with various cloud-hosted solutions, and broke down and enabled Dev Mode several times (and always returned). To be honest, I'm not sure how many hours I've racked up in this single pursuit.

Well, I found a solution where not only can I setup and run Jupyter, pandas, bs4, matplotlib, but I can wipe everything and reproduce it again easily. [UserLAnd], a relatively new Android app, makes this possible. For more information on the app, see this article on [Android Community]. 

Using this app, and a couple of others, here are the steps I use to run Jupyter on my Chromebook.

# Overview


After a lot of trial and error I've distilled the setup to the following basic steps:
1. Install two Android apps and one ChromeOS app
2. Get the basic Ubuntu environment and Secure Shell ssh up and running
3. Run the Shell Script I created to install everything else

# Setup

### Install Applications
* Install from Google Play Store: UserLAnd and ConnectBot
  * Make sure to launch ConnectBot once, to ensure that any wizard that pops up initially is skipped.
* Install from Chrome Web Store: [Secure Shell App]

### Create and Launch Ubuntu Session

* Launch **UserLAnd**
* Select **Ubuntu**
* Input **user** and **passwords** (these are usernames and pws for this Ubuntu session) when prompted
  * Because I'm running this locally, I opted for simple passwords
* For connection type, select **SSH**
* **NOTE:** The setup process will take several minutes. When complete, it should auto-launch ConnectBot. If ConnectBot doesn't start successfully, close it and double tap/click Ubuntu in UserLAnd again. This sometimes seems to be an issue only for the first initialization.

### Setup and Launch Native ChromeOS ssh

* When ConnectBot first starts, it prompts for a **password** (at the very bottom of the window) - this is the password created above.
* Next, input the following commands, one at a time:
```
whoami
hostname -I
ps aux
```

#### Interpret the results:
* **SSH User:** "whoami": shows you the **user**
* **SSH IP:** "hostname -I": **IPv4 address** is the first info in the results. For me the IP was the standard 100.115.92.2. Pay attention to your results, since this number can vary a little,
* **SSH Port:** "ps aux": look for the 4 digit number in lines that include "dropbear". For me the number was **2022**.
* Your information should be similar to:
  * **User**
  * IP: **100.115.92.2**
  * Port: **2022**
* Setup Secure Shell App for native ChromeOS ssh


#### Launch the Secure Shell App

* Create a **New Connection**
* Configure:
  * username@hostname/free form: **[username]@[IPv4 address]:[ssh-port]**
    * Example: user@100.115.92.2:2022
  * username: **[user]**
  * hostname: **100.115.92.2**
  * port: **2022**
* When complete, select: **[ENTER] Connect**
* The session will start and prompt for the user’s password - **input password**


### Setup Jupyter environment:

* Input the commands below, one line at a time (note: the "sh" step will take several minutes):
```
su
apt-get update
apt-get install wget
wget https://sites.google.com/site/theogeekfiles/files/jupyter-setup.sh
sh jupyter-setup.sh
exit
```
* note: "exit" is because it's not recommended to run Jupyter as root.

#### Launch Jupyter

* Because the goal is to access the jupyter web server in UserLAnd, the launch command requires some modification:

```
jupyter notebook --ip=0.0.0.0
```

* The result will be a URL that looks like this:
```
http://(localhost or 127.0.0.1):8888/?token=a9703017ced4c47b89d504a2b4739bc84638a8b5fa64da19
```
* Copy and paste the URL into Chrome, and replace the "(localhost or 127.0.0.1)" with you sessions, IP (i.e., 100.115.92.2).
* Jupyter Note should launch normally.
* DONE
  * You now have an environment with jupyter, pandas, bs4, and matplotlib. To install additional packages, just use pip as root, or "sudo pip." 

#### Additional Notes:
* Include sessions actual IP in launch command, to avoid editing the URL after copy/paste:
```
jupyter notebook --ip=100.115.92.2
```
* Launching Jupyter Lab is the same as Jupyter Notebook:
```
jupyter lab --ip=0.0.0.0
```
* Repository for the Shell Script: [Jupyter for UserLAnd on ChromeOS]


[Android Community]: https://androidcommunity.com/userland-allows-linux-apps-distributions-run-on-android-20181019/
[Secure Shell App]: https://chrome.google.com/webstore/detail/secure-shell-app/pnhechapfaindjhompbnflcldabbghjo/related?utm_source=chrome-app-launcher-search
[UserLAnd]: https://github.com/CypherpunkArmory/UserLAnd
[Jupyter for UserLAnd on ChromeOS]: https://github.com/darrida/chromeos_jupyter_for_userland
