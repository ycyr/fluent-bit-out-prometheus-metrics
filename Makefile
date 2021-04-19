all: build start logs wait show-metrics

clean:
	rm -rf *.so *.h *~

container-image:
	docker build -t fb/fluent-bit-plugin-loki:latest -f Dockerfile .

test:
	docker run --rm fb/fluent-bit-plugin-loki:latest

build: clean
	docker-compose build

start:
	docker-compose up -d

stop:
	docker-compose down

logs:
	docker-compose logs

restart-fluent-bit:
	docker-compose restart fluent-bit

show-metrics:
	curl -s http://127.0.0.1:9091/metrics | grep fluentbit

wait:
	sleep 2

build-plugin:
	go build -buildmode=c-shared -o out_prometheus_metrics.so