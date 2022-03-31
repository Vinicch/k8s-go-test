IMAGE=ai-controller
TAG=1.0

deploy:
	docker build -t $(IMAGE):$(TAG) .
	kind load docker-image $(IMAGE):$(TAG) --name ai
	kubectl apply -f deployment.yaml

restart:
	kubectl rollout restart deployment $(IMAGE)
