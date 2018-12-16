
build-sampleapp:
	docker build sampleapp -t pnyak/grafana-loki-test

push-sampleapp: build-sampleapp
	docker push pnyak/grafana-loki-test

deploy-sampleapp:
	kubectl apply -f manifests/sampleapp.yaml

delete-sampleapp:
	kubectl delete -f manifests/sampleapp.yaml

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