SERVICE_NAME=hello-world-printer
DOCKER_IMG_NAME=$(SERVICE_NAME)

.PHONY : test
#nie przejmuj sie jezeli istnieje plik albo folder o tej nazwie,
#po prostu wykonaj komende i uruchom testy

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

test:
	#PYTHONPATH=. py.test; \
	PYTHONPATH=. py.test --verbose -s

test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=.

test_xunit:
	PYTHONPATH=. py.test -s --cov=. --cov-report xml --junit-xml=test_results.xml

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run

lint:
	black hello_world test

make lint_check:
	black --check hello_world test

docker_build:
	docker build -t $(DOCKER_IMG_NAME) .

docker_run: docker_build
	docker run \
		--name $(SERVICE_NAME)-dev \
			-p 5000:5000 \
			-d $(DOCKER_IMG_NAME)
docker_stop:
	docker stop $(SERVICE_NAME)-dev

USERNAME=agnieszkagi
TAG=$(USERNAME)/$(DOCKER_IMG_NAME)

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag $(DOCKER_IMG_NAME) $(TAG); \
	docker push $(TAG); \
	docker logout;

test_smoke:
	curl -s -o /dev/null -w "%{http_code}" --fail 127.0.0.1:5000
