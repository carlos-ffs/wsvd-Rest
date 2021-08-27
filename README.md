# WSVDBench

This was originally a Benchmarking Vulnerability Detection Tools for Web Services available in **Nuno Antunes**' [github](https://github.com/nmsa/wsvd-bench) repository. For more details please check out the github previously mentioned.

# Changed WSVDBench

Some changes were made in order to make this project a RESTFull API for futher testing with [bBOXRT](https://git.dei.uc.pt/cnl/bBOXRT/tree/master) tool. **[TPC-W](http://tpc.org/tpcw/default5.asp)**, **[TPC-APP](http://tpc.org/tpc_app/default5.asp)** and **[TPC-C](http://www.tpc.org/tpcc/default5.asp)** will be use with these new changes. 

"TPC-W was a web server and database performance benchmark, proposed by Transaction Processing Performance Council. 
This benchmark defined the complete Web-based shop for searching, browsing and ordering books. The system under testing needed to provide the implementation of this shop." [[wiki]](https://en.wikipedia.org/wiki/TPC-W)

This changed version enable all operations to be done using REST services, these services will be tested with [bBOXRT](https://git.dei.uc.pt/cnl/bBOXRT/tree/master) tool and specify with a [OpenAPI](https://swagger.io/specification/) (Swagger) document.



## How to run it

First of all the code changed is optimize with queries for **PostgreSQL** and this tutorial will describe the steps to run in [**Tomcat**](http://tomcat.apache.org/) Web Server. 
You can change the queries, for other SQL engines, in the files available in `wsvd-Rest/src/main/java/pt/uc/dei/wsvdbench/tpcw/versions/` folder.

### 1. Setup up PostgreSQL database:
In `data` folder is available a **tpc.dump** file, it is a script to fill a PostgreSQL database. You can do that with this command:

* Command:
`sudo psql -h hostIPaddress -U userName -d databaseName -f /path/to/tpc.dump`

	- Example: `sudo psql -h localhost -U postgres -d wsvd -f ~/Documents/tpc.dump`

### 2. Setup up Database.java file:
* In `wsvd-Rest/src/main/java/pt/uc/dei/wsvdbench/util/` folder you must configure the class **Database.java** according to the database and configuration used in the [**first step**](#1-setup-up-postgreSQL-database).

variable  | description
------------- | -------------
`server`  | **IP address** where postgres' server is running (if local then "localhost")
`post`  | **Port number** of postgres' server is running (default value for postgres is 5432)
`dbName`  | **Database**'s name created.
`userName` | **User name** where database was created in postgres.
`passwd` | **Password** to the user with `username` where database was created in postgres.
 
### 3. You can (must) replace the class Logging.java for your favorite logging framework.

### 4. Jar file needed for tomcat

For tomcat we will need postgresql driver in order to communicate with the database and postgres server. 

* In `jarNeeded` folder is postgresql-42.2.22.jar, this jar file needs to be in **tomcat's** `lib` folder.

	- To find where your tomcat is located you can run something like this:
`sudo find / -name "tomcat"`. Mine is in `/opt/tomcat/` folder.

	- **postgresql-42.2.22.jar** file should be **located** in  `/path/to/tomcat/lib` folder. Example according to my tomcat's path `/opt/tomcat/lib`.

### 5. Build the .war package

* For TPC-C and TPC-W just go to their folders (`~/wsvd-Rest/TPCC` and `~/wsvd-Rest/TPCW`), where the pom.xml file is located, and build the .war package by running the following command:

	- `mvn install` or `mvn package`
	
* For TPC-APP will be needed two commands, the first one is to install dependencies. There is a file with the name **install.sh** to help, located in `~/wsvd-Rest/wsvd-tpcapp/installInMaven` and run the following command:
	- `./install.sh`
	
	After that go to **wsvd-tpcapp** folder:
	
	- `cd ~/wsvd-Rest/wsvd-tpcapp`
	
	Finnaly build the .war package by running the following command: 
	
	- `mvn install` or `mvn package`
	


The .war package will be located in `target` folder.

### 6. Deploy the services to Tomcat

* Copy the .war package gotten in [step 5](#5-build-the-war-package) to Tomcat `webapps` folder.

	- Example of `webapps` folder path: `/opt/tomcat/webapps`

* Restart Tomcat server. This command change from OS to OS but should look something like this:
	- `sudo service tomcat restart`


