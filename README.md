Welcome to the E-Commerce-project wiki!
This is a E-commerce open source project which is microservices based application
# E-Commerce Project - Open Telemetry

* This is a opensource E-commerce project called Open Telemetry which has many microservices like Shopping cart service, Currency service, Payment service, Dashboard service, Signup & Login service, Product homepage service, product service, Recommendation service, shipping service   etc. 
* There is front-end and backend service. 
* Access the project from Internet.

## Components in Application Architecture
* There is a load generator to fake generate load to match the real time e-commerce applications , to test the load on the application. 
* There is Frontend proxy, which is typically a reverse proxy which is similar to real-time applications. This is used to verify the requests before forwarding the traffic to front-end. 

Reverse proxies are used in real-time e-commerce projects to:

    1. Improve performance by caching frequently requested resources
    2. Enhance security by hiding origin servers and blocking malicious traffic
    3. Increase scalability by distributing traffic across multiple servers
    4. Enable SSL termination and offloading to reduce computational overhead

In this project the reverse proxy used is 'Envoy' , from the reverse proxy requests goes to Front-end, which is UI, from the front-end we can navigate to different pages/micro services. 

* Flagd - used For feature flagging, to disable a feature/service for some users. All the services are connected to Flagd, so that some services can be disabled for particular purpose.
* Ad Service - To run ads on this application
* Fraud Detection service 

This demo application is developed in multiple programming languages like Java script, python, Go, .Net, Kotlin, PHP, Ruby 









