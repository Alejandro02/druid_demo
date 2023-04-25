#!/bin/sh

KAFKA_HOME=/Users/alejandro_hernandez1/kafka_2.13-2.7.0/bin

COUNTER=0

while read -r line; do 
	if [ `expr $COUNTER % 1000` -eq 0 ]
	then
	    echo "There's a hundred events now"	    
	    $KAFKA_HOME/kafka-console-producer.sh --bootstrap-server localhost:9092 --topic sismos < kafka_input.txt
	    sleep 3
	    echo "Sent to kafka now"
	    echo "$line" > 'kafka_input.txt'
	else
		echo "$line" >> 'kafka_input.txt'
	fi
	COUNTER=$(( COUNTER + 1 ))
done < catalogo_sismos.csv
