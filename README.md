# pg-grafana-loki

Grafana recently released [loki](https://github.com/grafana/loki) which as per the readme is like Promtheus but for logs. This repository contains some manifests to deploy loki into an existing kubernetes cluster. It also comes with a sampleapp built in golang which just is a very very simple webserver and a dummy app which is logging to stdout constantly.

Deploy loki, promtail, grafana:
```
make deploy-all-loki
```

Deploy sample app:
```
make deploy-sample-app
```

Deploye logging app
```
make deploy-logging-app
```

## Grafana Explore

The best thing about the loki announcement was the Grafana Explore feature. For eons folks have been switching back in forth from grafana to datasource (prometheus, aws cloudwatch etc) to understand why their query doesn't work. But with Grfana Explore you should be able to query your datasource from one place. Oh and you can split query into two side by side tabs which is just perfect !!

## TODO

- Add Grafana configmap for datasource
- Add Prometheus manifest



