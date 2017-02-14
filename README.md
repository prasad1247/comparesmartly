# comparesmartly

CompareSmartly.in :

A Price Comparison Engine for Indian E-commerce players.

How Comparison Works :

1. First, all the products belonging to a category is downloaded from various retailers(Flipkart, Amazon, Snapdeal) and stored in temp table.
2. Considering Flipkart products as master list of products, each product's name is split, checked against other retailer's products as per brands and points for each product name is calculated.
3. Products with highest matching points are updated with same master product unique id.

How Website is built : 

Project is implemented using Spring Boot and uses MYSQL for Database. WebApp is deployed on openshift gear with 
domain name http://comparesmartly.in

More edits will come
