.PHONY: lint gen clean

lint:
	buf lint
	buf breaking --against '.git#branch=main' || true

gen:
	rm -rf gen
	buf generate

clean:
	rm -rf gen
