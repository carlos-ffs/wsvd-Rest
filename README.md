# WSVDBench

This was originally a Benchmarking Vulnerability Detection Tools for Web Services available in **Nuno Antunes**' [github](https://github.com/nmsa/wsvd-bench) repository. For more details please check out the github previously mentioned.

# Changed WSVDBench TPC-W

Some changes were made in order to make this project a RESTFull API for futher testing with [bBOXRT](https://git.dei.uc.pt/cnl/bBOXRT/tree/master) tool. Only **TPC-W** will be use with these new changes. 

"TPC-W was a web server and database performance benchmark, proposed by Transaction Processing Performance Council. 
This benchmark defined the complete Web-based shop for searching, browsing and ordering books. The system under testing needed to provide the implementation of this shop." [[wiki]](https://en.wikipedia.org/wiki/TPC-W)

This changed version enable all operations to be done using REST services, these services will be tested with [bBOXRT](https://git.dei.uc.pt/cnl/bBOXRT/tree/master) tool and specify with a [OpenAPI](https://swagger.io/specification/) (Swagger) document.

## Rest services available

**Application path:** /rest

**Example** to a service path: `http://localhost:8080/wsvd_war/rest/DoAuthorSearch/doAuthorSearch_VxA?search_key=N`


Service Name  | Number of operations | Method | Service Path | Parameters
:-: | :-: | :-: | :-- | :-:
AdminUpdate  | 2 | POST | /AdminUpdate/adminUpdate\_Vx0 <br /> /AdminUpdate/adminUpdate\_VxA | Location: Query <br /> name: i\_id <br /> Type: (int) <br /> -------------- <br /> Location: Query <br /> name: cost <br /> Type: (double) <br /> -------------- <br /> Location: Query <br /> name: image <br /> Type: (String) <br /> -------------- <br /> Location: Query <br /> name: thumbnail <br /> Type: (String)
CreateNewCustomer  | 6 | POST | /CreateNewCustomer/createNewCustomer\_Vx0 <br /> /CreateNewCustomer/createNewCustomer\_VxA <br /> /CreateNewCustomer/createNewCustomer\_Vx078 <br /> /CreateNewCustomer/createNewCustomer\_Vx103 <br /> /CreateNewCustomer/createNewCustomer\_Vx113 <br /> /CreateNewCustomer/createNewCustomer\_Vx132 <br /> | JSON
CreateShoppingCart  | 2 | POST | /CreateShoppingCart/createShoppingCart\_Vx0 <br /> /CreateShoppingCart/createShoppingCart\_VxA | JSON
DoAuthorSearch  | 2 | GET | /DoAuthorSearch/doAuthorSearch\_VxA <br /> /DoAuthorSearch/doAuthorSearch\_Vx0 | Location: Query <br /> name: search_key <br /> Type: (String)
DoSubjectSearch  | 2 | GET | /DoSubjectSearch/doSubjectSearch\_Vx0 <br /> /DoSubjectSearch/doSubjectSearch\_VxA | Location: Query <br /> name: search_key <br /> Type: (String)
DoTitleSearch  | 2 | GET | /DoTitleSearch/doTitleSearch\_Vx0 <br /> /DoTitleSearch/doTitleSearch\_VxA| Location: Query <br /> name: search_key <br /> Type: (String)
GetBestSellers  | 2 | GET | /GetBestSellers/getBestSellers\_Vx0 <br /> /GetBestSellers/getBestSellers\_VxA| Location: Query <br /> name: subject <br /> Type: (String)
GetCustomer  | 2 | GET | /GetCustomer/getCustomer\_Vx0 <br /> /GetCustomer/getCustomer\_VxA | Location: Query <br /> name: UNAME <br /> Type: (String)
GetMostRecentOrder  | 2 | GET | /GetMostRecentOrder/getMostRecentOrder\_Vx0 <br /> /GetMostRecentOrder/getMostRecentOrder\_VxA | Location: Query <br /> name: c_uname <br /> Type: (String)
GetNewProducts  | 2 | GET | /GetNewProducts/getNewProducts\_Vx0 <br /> /GetNewProducts/getNewProducts\_VxA | Location: Query <br /> name: subject <br /> Type: (String)
GetPassword  | 2 | GET | /GetPassword/getPassword\_Vx0 <br /> /GetPassword/getPassword\_VxA | Location: Query <br /> name: C_UNAME <br /> Type: (String)
GetUsername  | 2 | GET | /GetUsername/getUserName\_Vx0 <br /> /GetUsername/getUserName\_VxA | Location: Query <br /> name: C_ID <br /> Type: (String)

## How to run it

Fist of all the code changed is optimize with queries for **PostgreSQL** and this tutorial will describe the steps to run in [**Tomcat**](http://tomcat.apache.org/) Web Server. 
You can change the queries, for other SQL engines, in the files available in `wsvd-bench/src/main/java/pt/uc/dei/wsvdbench/tpcw/versions/` folder.

### <a name="step1"></a>1. Setup up PostgreSQL database:
In `data` folder is available a **tpc.sql** file, it is a script to fill a PostgreSQL database. You can do that with this command:

* Command:
`sudo psql -h hostIPaddress -U userName -d databaseName -f /path/to/tpc.sql`

	- Example: `sudo psql -h localhost -U postgres -d wsvd -f ~/Documents/tpc.sql`

### 2. Setup up Database.java file:
* In `wsvd-bench/src/main/java/pt/uc/dei/wsvdbench/util/` folder you must configure the class **Database.java** according to the database and configuration used in the [**first step**](#step1).

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

### <a name="step5"></a>5. Build the .war package

* To build the .war package go to where pom.xml is located, probably in `wsvd-bench` folder, and run this command:

	- `mvn install` or `mvn package`

The .war package will be located in `target` folder.

### 6. Deploy the services Copy the in Tomcat

* Copy the .war package gotten in [step 5](#step5) to Tomcat `webapps` folder.

	- Example of `webapps` folder path: `/opt/tomcat/webapps`

