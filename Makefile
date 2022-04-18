IMAGE=ai-controller
TAG=1.0
POD=$(IMAGE)

deploy:
	docker build -t $(IMAGE):$(TAG) .
	k3d image import $(IMAGE):$(TAG) -c ai
	kubectl apply -f deployment.yaml
	kubectl rollout restart deployment $(POD)
