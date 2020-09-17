.PHONY: all
all: build publish

.PHONY: build
build:
	docker build -t local/ant-deploy - < ant-deploy.Dockerfile

.PHONY: publish
publish:
	docker tag local/ant-deploy localhost.localdomain:5000/local/ant-deploy
	docker push localhost.localdomain:5000/local/ant-deploy
