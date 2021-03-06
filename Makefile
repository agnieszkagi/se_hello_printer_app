.PHONY : test
#nie przejmuj sie jezeli istnieje plik albo folder o tej nazwie,
#po prostu wykonaj komende i uruchom testy

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

test:
	#PYTHONPATH=. py.test; \
	PYTHONPATH=. py.test --verbose -s

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run

lint:
	flake8 hello_world test