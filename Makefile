PYTHON ?= python
PHP ?= php

all:
	$(PYTHON) -mpooledbismuth -v --keyfile /root/Bismuth-3.44/privkey.der -p /root/Bismuth-3.44/peers.txt -m 0.0.0.0:4047 -l /root/Bismuth-3.44/static/ledger.db

.PHONY: webui
webui:
	php -t webui -S 0.0.0.0:8031

clean:
	find . -name '*.pyc'  | xargs -n 1 rm
	rm -rf tests/data data/*

.PHONY: test
test:
	rm -rf tests/data
	mkdir -p tests/data/audit tests/data/done
	PYTHONPATH=. pytest -t tests -i --color
