# Debezium Integration with MYSQL
This repository contains kubernetes manifests and charts to deploy a small eco-system of `Debezium` integrated with `MYSQL` and `Kafka`. Moreover, there is a sample debezium connector's config alongside sample data for mysql but you may use any setup as you wish.

More information about what is Debezium at the end.

## How to Deploy
Deploy services in the following order
1. Kafka
2. Kafka UI
3. MYSQL
4. Debezium Connector
5. Debezium UI

```shell
# deploy a chart
helm install CHART-NAME [CHART-DIR]

# deploy manifest
# oc can be replaced by any other cloud platform provider. e.g. kubectl
oc apply -f [MANIFEST-NAME].yaml
```
Note: You may need to wait for services to be ready for a little due to different factors like image pulling. Make sure each resource is deployed and is ready before moving to next step.

## How to see data flow
Follow the below steps to go through a cdc full cycle.
1. Create a table
2. Create a connector using `debezium connect` CLI or UI
3. Insert some data into the table
4. Watch messages in kafka topic using ui or consume them using kafka's official cli

## What is Debezium?
Debezium is an open source distributed platform for change data capture. Start it up, point it at your databases, and your apps can start responding to all of the inserts, updates, and deletes that other apps commit to your databases. Debezium is durable and fast, so your apps can respond quickly and never miss an event, even when things go wrong.

## Use-cases
- data replication
    - Replicate data to other DB
    - feed analytics system or dwh
    - feed data to other teams
- microservices
    - data propagation
    - extract microservices from monolith
- others
    - auditing/historization
        - track all the changes in customer data and meta data
    - update or invalidate caches
    - enable FTS via elasticsearch
    - ui live update
    - streaming queries

## Kafka
Most commonly, you deploy Debezium by means of Apache Kafka Connect. Kafka Connect is a framework and runtime for implementing and operating:
- Source connectors such as Debezium that send records into Kafka
- Sink connectors that propagate records from Kafka topics to other systems

The following image shows the architecture of a change data capture pipeline based on Debezium:
![debezium architecture](assets/debezium-architecture.png)


# Useful Links
- [Debezium Quick Start](https://debezium.io/documentation/reference/1.9/tutorial.html)
- [Debezium Connector List](https://debezium.io/documentation/reference/1.9/connectors/index.html)
- [Debezium UI](https://debezium.io/documentation/reference/stable/operations/debezium-ui.html)

## Contact Me
Feel free to contact me if you had any question or issue. Use the email address in my profile.