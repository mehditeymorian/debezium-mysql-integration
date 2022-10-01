KAFKA_URL=localhost:9094
KAFKA_TOPIC=database-history.people-1
CONNECTOR=people-connector-1

# check if debezium connect is ready
ready:
	curl -H "Accept:application/json" localhost:8083/

# return list of kafka connectors
connectors:
	curl -H "Accept:application/json" localhost:8083/connectors/

create:
	curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d @./data/config.json


validate:
	curl -i -X PUT -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connector-plugins/MySql/config/validate -d @./dataconfig-validate.json

check:
	curl -i -X GET -H "Accept:application/json" localhost:8083/connectors/$(CONNECTOR)

consume:
	./kafka-cli/bin/kafka-console-consumer.sh --bootstrap-server $(KAFKA_URL) --topic $(KAFKA_TOPIC) --from-beginning
