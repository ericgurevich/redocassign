.PHONY: docs
docs:
	#must run with sudo on my machine to start npm server
	sudo npm i -g http-server
	http-server -p 8000 --cors &
	docker pull redocly/redoc
	docker run -p 8081:80 -e SPEC_URL=http://localhost:8000/swagger.yaml redocly/redoc &
	#running. access from dockerurl:8081