PROJECT=blog
AUTHOR=channel11
REPO=registry.squizduos.ru

LOCAL_HUGO_EXEC=hugo

CURRENT=$(shell date --iso=date)


serve:
	$(HUGO_EXEC) serve

docker-build:
	docker build -t ${AUTHOR}/${PROJECT}:dev .

docker-watch:
	docker run -it -p 1414:8080 --rm ${AUTHOR}/${PROJECT}:dev

push:
	docker tag ${AUTHOR}/${PROJECT}:dev ${REPO}/${AUTHOR}/${PROJECT}:${CURRENT}
	docker tag ${AUTHOR}/${PROJECT}:dev ${REPO}/${AUTHOR}/${PROJECT}:latest
	docker push ${REPO}/${AUTHOR}/${PROJECT}:${CURRENT}
	docker push ${REPO}/${AUTHOR}/${PROJECT}:latest