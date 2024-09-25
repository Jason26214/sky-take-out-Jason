# Project Name: SKY TAKEOUT

## Sky Takeout Project Overview

This project (Sky Takeout) is a custom software product designed specifically for catering enterprises (restaurants,
cafés). It includes two parts: a backend system management platform and a mini-program application. The backend system
is mainly provided for internal use by catering enterprises, allowing for the management and maintenance of restaurant
categories, dishes, combos, orders, employees, and other aspects. It also provides statistical functions for various
restaurant data and supports live order broadcasting. The mini-program is primarily intended for consumer use, allowing
users to browse dishes online, add items to the cart, place orders, make payments, and follow up on orders.

## Admin Side & User Side

### 1. Admin side

Used by internal employees of catering enterprises. The main functions include:

| Module              | Description                                                                                                                                |  
   |---------------------|--------------------------------------------------------------------------------------------------------------------------------------------|  
| Login/Logout        | Internal employees must log in to access the system's management backend.                                                                  |  
| Employee Management | Admins can manage employee information in the system backend, including functions such as view, add, edit, and disable.                    |  
| Category Management | Mainly manages the restaurant's dish categories or dish types, including functions such as view, add, edit, and delete.                    |
| Dish Management     | Mainly manages the restaurant's dish information, including view, add, edit, delete, enable, and disable functions.                        |
| Combo Management    | 	Mainly maintains information about current restaurant combos, including view, add, edit, delete, enable, and disable functions.           |
| Order Management    | 	Mainly maintains information about orders placed on the mobile app, including view, cancel, assign, complete, and download order reports. |
| Data Statistics     | 	Mainly provides statistical reports on various restaurant data, such as revenue, number of users, orders, etc.                            |

### 2. User Side
The mobile app is mainly for consumer use. The main functions include:  

| Module         | Description                                                                                                                                            |
|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| Login/Logout   | Users need to log in or register through WeChat mini-programs to place orders.                                                                         |
| Browse Menu    | Users can browse categories such as dishes or combos, and select dish information loaded under the chosen category to make their selection.            |
| Shopping Cart  | Users can add selected dishes to the cart, mainly including functions like viewing, adding to the cart, deleting from the cart, and clearing the cart. |
| Order Checkout | Users can choose the dishes from the cart, proceed with checkout and payment for the order.                                                            |
| Personal Info  | Users can manage their personal information, such as managing delivery addresses and viewing order history.                                            |

## Technology Selection
* **User Layer**: node.js, VUE.js, ElementUI, WeChat Mini Program, apache echarts  
* **Gateway Layer**: Nginx  
* **Application Layer**: Spring Boot, Spring MVC, Spring Task, httpclient, Spring Cache, JWT, Alibaba Cloud OSS, Swagger, POI, WebSocket  
* **Data Layer**: MySQL, Redis, mybatis, pagehelper, spring data redis  
* **Tools**: Git, maven, Junit, postman  

## How to run
### 1. How to run Admin Side
1. Create a new file called: "application-dev.yml"
``` yml
sky:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    host: {your_host}
    port: {your_port}
    database: {your_database}
    username: {your_username}
    password: {your_password}
  alioss:
    endpoint: {your_endpoint}
    access-key-id: {your_access_key_id}
    access-key-secret: {your_access_key_secret}
    bucket-name: {your_bucket_name}
  redis:
    host: {your_redis_host}
    port: {your_redis_port}
    password: {your_redis_password}
    database: {your_redis_database}
  wechat:
    # Your own WeChat appid and secret
    appid: {your_wechat_appid}
    secret: {your_wechat_secret}
    # The following configurations are for WeChat Pay, provided by the tutorial. They are invalid in this project without a business license.
    mchid: {your_wechat_mchid}
    mchSerialNo: {your_mch_serial_no}
    privateKeyFilePath: {your_private_key_file_path}
    apiV3Key: {your_api_v3_key}
    weChatPayCertFilePath: {your_wechat_pay_cert_file_path}
    # Callback URL: This is the URL where WeChat will send notifications to your local service (each time the domain changes, this needs to be updated).
    notifyUrl: {your_notify_url}
    refundNotifyUrl: {your_refund_notify_url}
```
2. Import sql file in "sky-server/src/main/resources/MySql/sky_take_out.sql"
3. Run nginx.exe in "sky-server/src/main/resources/Nginx/nginx.exe"
4. Run SkyApplication.java in "sky-server/src/main/java/com/sky/SkyApplication.java"

### 2. How to run User Side
If you want to run the user side, you need to clone the [sky-take-out-wechat-userFrontEnd](https://github.com/Jason26214/sky-take-out-wechat-userFrontEnd.git) repository into WeChat Developer Tools and run it there.