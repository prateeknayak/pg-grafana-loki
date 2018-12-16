# pg-grafan-loki

*NOTE:* This repository is just meant for testing purpose. Please do not deploy these components to production as is. Please consider productionising each of the given components.

So, Grafana recently released [loki](https://github.com/grafana/loki) which as per the readme is like Promtheus but for logs. This repository contains some manifests to deploy loki into an existing kubernetes cluster along with couple of dummy applications that log to stdout every now and then.

## Components

The official repository has a ksonnet based build and deploy thing. But for the sake of this example we are going to use static manifests.

### Loki

The main server which ingests all the logs forwarded to it and also provides a means to query via the Grafana interface. 

Considerations in this example:

- It deploys loki without much deliberation on persistence of aggregated data which might be useful if you want to deploy this to production.
- Loki service is of type NodePort which is handy when running kubernetes via docker-for-mac.
- Loki authentication is disabled.

### Promtail

The thing that actually does most of the work of collecting all the logs and sending them to loki for aggregation and querying.

### Grafana

The best thing about the Loki announcement was the Grafana Explore feature. For eons folks have been switching back and forth from grafana to data-source (prometheus, AWS cloudwatch etc) to understand why their query doesn't work. But with Grafana Explore you should be able to query your data-source from one place. Oh and you can split query into two side by side tabs which is just perfect !!


Considerations in this example:

- Again no persistence
- Default username password `admin:admin` (BAD !! Please don't deploy this in prod as is.)

### Prometheus

Prometheus set to scrape metrics from kube-state-metrics and for the cluster level metrics and any pod annotated with `prometheus.io` annotation. You do not need to port forward to prometheus any more. You can just use the grafana explorer view to search through prometheus data-source (yay !!).

## Deploy loki to cluster

Deploy loki, promtail, grafana, prometheus:
```
make deploy-all-loki
```

Deploy sample app:
```
make deploy-sample-app
```

Deploy logging app
```
make deploy-logging-app
```


## TODO

- ~Add Grafana configmap for data-source~
- Add Prometheus deployment
- Add Tracing to the sample app
- Build some dashboards etc.



