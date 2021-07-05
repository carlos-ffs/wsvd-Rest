# WSVDBench

This was originally a Benchmarking Vulnerability Detection Tools for Web Services available in **Nuno Antunes**' [github](https://github.com/nmsa/wsvd-bench) repository. For more details please check out the github previously mentioned.

# Changed WSVDBench TPC-W

Some changes were made in order to make this project a RESTFull API for futher testing with [bBOXRT](https://git.dei.uc.pt/cnl/bBOXRT/tree/master) tool. Only **TPC-W** will be use with these new changes. 

"TPC-W was a web server and database performance benchmark, proposed by Transaction Processing Performance Council. 
This benchmark defined the complete Web-based shop for searching, browsing and ordering books. The system under testing needed to provide the implementation of this shop." [[wiki]](https://en.wikipedia.org/wiki/TPC-W)

This changed version enable all operations to be done using REST services, these services will be tested with [bBOXRT](https://git.dei.uc.pt/cnl/bBOXRT/tree/master) tool and specify with a [OpenAPI](https://swagger.io/specification/) (Swagger) document.


**Go to:**

* [REST Services available](#rest-services-available)
* [How to run it](#how-to-run-it)

## Rest services available


**Application path:** /rest  

**Example** to a service path: `http://localhost:8080/wsvd_war/rest/DoAuthorSearch/doAuthorSearch_VxA?search_key=N`  



Service Name  | Number of operations | Method | Operation Path | Parameters
:-: | :-: | :-: | :-- | :--:
 AdminUpdate  | 2 | POST | /adminUpdate\_Vx0 | [Table one](#table-one)
 | | POST  | /adminUpdate\_VxA | [Table one](#table-one)
 | | | |
 CreateNewCustomer | 6 | POST | /createNewCustomer\_Vx0  | [Table two](#Table-two)
 | | POST  | /createNewCustomer\_VxA | [Table two](#table-two)
 | | POST  | /createNewCustomer\_Vx078 | [Table two](#table-two)
 | | POST  | /createNewCustomer\_Vx103 | [Table two](#table-two)
 | | POST  | /createNewCustomer\_Vx113 | [Table two](#table-two)
 | | POST  | /createNewCustomer\_Vx113 | [Table two](#table-two)
 | | POST  | /createNewCustomer\_Vx132 | [Table two](#table-two)
 | | | |
 CreateShoppingCart | 2 | POST | /createShoppingCart\_Vx0  | [Table two](#table-two)
 | | POST  | /createShoppingCart\_VxA | [Table two](#table-two)
 | | | |
 DoAuthorSearch | 2 | GET | /doAuthorSearch\_VxA  | [Table three](#table-three)
 | | GET  | /doAuthorSearch\_Vx0 | [Table three](#table-three)
 | | | |
 DoSubjectSearch | 2 | GET | /doSubjectSearch\_Vx0   | [Table three](#table-three)
 | | GET  | /doSubjectSearch\_VxA | [Table three](#table-three)
 | | | |
 DoTitleSearch | 2 | GET | /doTitleSearch\_Vx0  |  [Table three](#table-three)
 | | GET  | /doTitleSearch\_VxA | [Table three](#table-three)
 | | | |
 GetBestSellers | 2 | GET | /getBestSellers\_Vx0  |  [Table four](#table-four)
 | | GET  | /getBestSellers\_VxA | [Table four](#table-four)
 | | | |
 GetCustomer | 2 | GET | /getCustomer\_Vx0  |  [Table five](#table-five)
 | | GET  | /getCustomer\_VxA | [Table five](#table-five)
 | | | |
 GetMostRecentOrder | 2 | GET | /getMostRecentOrder\_Vx0 |    [Table six](#table-six)
 | | GET  | /getMostRecentOrder\_VxA | [Table six](#table-six)
 | | | |
 GetNewProducts | 2 | GET | /getNewProducts\_Vx0   |  [Table four](#table-four)
 | | GET  | /getNewProducts\_VxA | [Table four](#table-four)
 | | | |
 GetPassword | 2 | GET | /getPassword\_Vx0 |    [Table seven](#table-seven)
 | | GET  | /getPassword\_VxA | [Table seven](#table-seven)
 | | | |
 GetUsername | 2 | GET | /getUserName\_Vx0   |  [Table eight](#table-eigth)
 | | GET  | /getUserName\_VxA | [Table eight](#table-eigth)
 
 
 
 
 
 
 

### Parameres for each operation  

#### Table one:

 Parameters  | Location | name | Type | required 
 :-: | :-: | :-- | :-- | :---: 
 1º | Query | i\_id | Int | True 
 2º | Query  | cost |  double | True 
 3º | Query  | image |  String | False 
 4º | Query  | thumbnail | String | False 



#### Table two:


 Parameters  | Location | name | Type | required 
 :-: | :-: | :-- | :-- | :---: 
 1º | Request Body |  | JSON | True 
 
 * JSON example for **CreateNewCustomer** service:
 
```
{
    "c_uname": "OG",
    "c_passwd": "og",
    "c_fname": ",C[BQ!vNyrW",
    "c_lname": "ZKvPiElnXr]D",
    "c_phone": "1791427789",
    "c_email": "OG@Ho+)w.com",
    "c_since": "2009-05-19",
    "c_last_visit": "2009-05-25",
    "c_login": "2010-12-23",
    "c_expiration": "2010-12-25",
    "c_discount": 0.42,
    "c_balance": 0.0,
    "c_ytd_pmt": 988.55,
    "c_birthdate": "1974-04-04",
    "c_data": "TXRs^CNtt[a+JSe=O,moGqk][_x,s&/Fdfm(jpoZMPD$c&z@HUoL._Sx=X!zGy)*UN]C;U}:.e|@aw{oNoVBgZE W*FCArPtu$WcvD%eq)bz$U*/z.=ztq,lBK/X!m!CI/)MT{u|wrh]Kl%H!wKa+DY@#Cr$gM*IjFs]O;NhIJ|?t]%;-mL+zeLX^[faa]J sKQ*p[J#j$ETD+gBf^DpV_K^f/y;H,UNK&Cm!a|=so)CR~=:Zv:",
    "addr_id": 1171,
    "addr_street1": "T+$Ld]MbVpHcD:Xvh}w{L&B&|q:Z",
    "addr_street2": ")VYU{Adu=hIB#fLK|qx",
    "addr_city": "H;CT",
    "addr_state": "fEE)]d",
    "addr_zip": "_cNbIEw",
    "addr_co_id": 62,
    "co_name": "Jamaica"
}
```
 
 
* JSON example for **CreateShoppingCart** service:
 
```
{
    "I_ID": 99,
    "ids": ["as", "ss", "cc"],
    "quantities": [2,3,4],
    "SHOPPING_ID": 998
}
```


#### Table three:

 Parameters  | Location | name | Type | required 
 :-: | :-: | :-- | :-- | :---: 
 1º | Query | search_key | String | True 
 
#### Table four:

 Parameters  | Location | name | Type | required 
 :-: | :-: | :-- | :-- | :---: 
 1º | Query | subject | String | True 

#### Table five:

 Parameters  | Location | name | Type | required 
 :-: | :-: | :-- | :-- | :---: 
 1º | Query | UNAME | String | True 
 
#### Table six:

 Parameters  | Location | name | Type | required 
 :-: | :-: | :-- | :-- | :---: 
 1º | Query | c\_uname | String | True 
 
  
#### Table seven:

 Parameters  | Location | name | Type | required 
 :-: | :-: | :-- | :-- | :---: 
 1º | Query | C\_UNAME | String | True 
 
#### Table eight:

 Parameters  | Location | name | Type | required 
 :-: | :-: | :-- | :-- | :---: 
 1º | Query | C\_ID | String | True 



## How to run it

Fist of all the code changed is optimize with queries for **PostgreSQL** and this tutorial will describe the steps to run in [**Tomcat**](http://tomcat.apache.org/) Web Server. 
You can change the queries, for other SQL engines, in the files available in `wsvd-Rest/src/main/java/pt/uc/dei/wsvdbench/tpcw/versions/` folder.

### 1. Setup up PostgreSQL database:
In `data` folder is available a **tpc.sql** file, it is a script to fill a PostgreSQL database. You can do that with this command:

* Command:
`sudo psql -h hostIPaddress -U userName -d databaseName -f /path/to/tpc.sql`

    - Example: `sudo psql -h localhost -U postgres -d wsvd -f ~/Documents/tpc.sql`

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

* To build the .war package go to where pom.xml is located, probably in `wsvd-Rest` folder, and run this command:

    - `mvn install` or `mvn package`

The .war package will be located in `target` folder.

### 6. Deploy the services Copy the in Tomcat

* Copy the .war package gotten in [step 5](#5-build-the-war-package) to Tomcat `webapps` folder.

    - Example of `webapps` folder path: `/opt/tomcat/webapps`


