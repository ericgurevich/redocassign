.PHONY: docs
docs:
	docker build -t loc/redoc-gurevich .
	docker run -p 80:80 -v $$PWD/specs:/app/specs loc/redoc-gurevich
	#running. access from dockerurl:80
