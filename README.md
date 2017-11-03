# Python-Workshop-TSA-Hadoop

In this lecture we are going to learn what is Hadoop and how to perform parallel computing using hadoop.

After this lecture you should be able to:

* understand the structure of HDFS, how files are stored in HDFS and how to exchange files with HDFS;
* understand how MapReduce works and run your own MapReduce program written in python using Hadoop streaming utility;
* write you own PIG script to solve data processing problems in your class project and future research.

# Here are something you need to prepare before the workshop:

## Required:

We will be using INTRANS test cluster in this lecture, but you need to install some software on your laptop to support the connection to the cluster.

## Windows:

1. Putty: 

Download link: https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html

Download the 32-bit or 64-bit based on your system architecture

![Alt text](/figures_support/Putty-download.PNG)

2. WinScp

Download Link: https://winscp.net/eng/download.php

![Alt text](/figures_support/winscp-download.PNG)

## Mac

1. FileZilla

Download Link: https://filezilla-project.org/

 Let's now try to connnect to the cluster and HDFS:
 
 ## Windows:

* Connect to cluster:

Open Putty and login. Use the following credentials for logging in.

Ip Adress: s06.intrans.iastate.edu

Username: team

Password: classpass

![Alt text](putty-login-pc.PNG)

* Exchanges files with cluster

1. Open WinSCP and login with the same credentials you used for Putty

![Alt text](WinSCPlogin-pc.PNG)

2. WinSCP provides a save file exchange platform between your laptop and the remote linux machine. The left window is your laptop, the right window is the remote linux machine you logged in (in this case it is s06.intrans.iastate.edu which we also call it "local" or "server" or "cluster" in different situations.....) You can upload files from your laptop to the cluster by simply dragging and dropping files to the right window, and you can download files to you laptop from the cluster by simply dragging and dropping files from the right window. 

![Alt text](WinSCPmachine-pc.PNG)

The "Local" or "server" is not actually HDFS and the two folders you have seen are not in HDFS.You can peek the files in HDFS by typing "hdfs dfs -ls" in Putty command line.

![Alt text](putty-hdfs-pc.PNG)

## Mac

* Connect to cluster:
1. Open Terminal and type "ssh username@URL". In our case, "team@s06.intrans.iastate.edu" 

2. Enter the password: classpass.

* exchange file with cluster:

Open FileZilla and login: type URL in host, username, password and 22 in port: 

The file access (upload and download) is same as WinScp (drag and drop). 



