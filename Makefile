php:
	docker-compose run php $(filter-out $@,$(MAKECMDGOALS))

npm:
	docker-compose run --rm nodejs npm $(filter-out $@,$(MAKECMDGOALS))

qa: phpstan cs

cs:
	docker-compose run php vendor/bin/codesniffer src tests

csf:
	docker-compose run php  vendor/bin/codefixer src tests

phpstan:
	docker-compose run php vendor/bin/phpstan analyse -l max -c phpstan.neon src

tests:
	docker-compose run php vendor/bin/tester -s -p php --colors 1 -C tests/cases
