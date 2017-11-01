ZOOKEEPER_CONNECT := $(ZOOKEEPER_ENDPOINTS)
.PHONY:build
build:
	mvn clean package assembly:single docker:build

.PHONY:container
container:
	container-builder-local --dryrun=false .

.PHONY:run
run:
	docker run -d -p 9000:9000 -e ZOOKEEPER_CONNECT=$(ZOOKEEPER_CONNECT) kafdrop
