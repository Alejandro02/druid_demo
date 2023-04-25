#!/bin/sh


sleep 60

kafka-console-producer.sh --bootstrap-server kafka:9093 --topic sismos < catalogo_sismos_sample.csv

