build-sample-app:
	docker build sampleapp -t pnyak/grafana-loki-test

push-sample-app: build-sample-app
	docker push pnyak/grafana-loki-test

deploy-sample-app:
	kubectl apply -f manifests/sample-app.yaml

delete-sample-app:
	kubectl delete -f manifests/sample-app.yaml

deploy-logging-app:
	kubectl apply -f manifests/logging-app.yaml

delete-logging-app:
	kubectl delete -f manifests/logging-app.yaml

deploy-loki:
	kubectl apply -f manifests/loki.yaml

delete-loki:
	kubectl delete -f manifests/loki.yaml

deploy-promtail:
	kubectl apply -f manifests/promtail.yaml

delete-promtail:
	kubectl delete -f manifests/promtail.yaml

deploy-grafana:
	kubectl apply -f manifests/grafana.yaml

delete-grafana:
	kubectl delete -f manifests/grafana.yaml

deploy-prom:
	kubectl apply -f manifests/prometheus.yaml

delete-prom:
	kubectl delete -f manifests/prometheus.yaml

port-forward-prom:
	kubectl --namespace kube-system port-forward $$(kubectl get pods --namespace kube-system -l "app=prometheus,group=prometheus" -o jsonpath="{.items[0].metadata.name}") 9090

deploy-all-loki: deploy-loki deploy-promtail deploy-grafana deploy-prom

delete-all-loki: delete-grafana delete-promtail delete-loki delete-prom


.PHONY: build-sample-app \
push-sample-app \
deploy-sample-app \
delete-sample-app \
deploy-logging-app \
delete-logging-app \
deploy-loki \
delete-loki \
deploy-promtail \
delete-promtail \
deploy-grafana \
delete-grafana \
deploy-all-loki \
delete-all-loki
