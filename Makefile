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
	docker run -t -p 9090:80 ${AUTHOR}/${PROJECT}:dev

push:
	docker tag ${AUTHOR}/${PROJECT}:dev ${REPO}/${AUTHOR}/${PROJECT}:${CURRENT}
	docker tag ${AUTHOR}/${PROJECT}:dev ${REPO}/${AUTHOR}/${PROJECT}:latest
	docker push ${REPO}/${AUTHOR}/${PROJECT}:${CURRENT}
	docker push ${REPO}/${AUTHOR}/${PROJECT}:latest