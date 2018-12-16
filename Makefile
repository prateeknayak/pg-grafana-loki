build-sample-app:
	docker build sampleapp -t pnyak/grafana-loki-test

push-sample-app: build-sampleapp
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

deploy-all-loki: deploy-loki deploy-promtail deploy-grafana

delete-all-loki: delete-grafana delete-promtail delete-loki


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
