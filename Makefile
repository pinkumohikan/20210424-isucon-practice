.PHONY: gogo kataribe

gogo: stop-services truncate-logs start-services

stop-services:
	sudo systemctl stop nginx
	sudo systemctl stop isubata.nodejs
	sudo systemctl stop mysql

start-services:
	sudo systemctl start mysql
	sudo systemctl start isubata.nodejs
	sudo systemctl start nginx

truncate-logs:
	sudo truncate --size 0 /var/log/nginx/access.log
	sudo truncate --size 0 /var/log/nginx/error.log

bench:
	ssh isucon@18.182.65.45 "make -C ~/isubata/bench bench"

kataribe:
	sudo cat /var/log/nginx/access.log | ./kataribe
