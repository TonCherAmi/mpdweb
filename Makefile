FRONTEND_DIR := ${PWD}/frontend
FRONTEND_OUT_DIR := ${FRONTEND_DIR}/dist

BACKEND_DIR := ${PWD}/backend

all: frontend backend

frontend:
	yarn --cwd ${FRONTEND_DIR} install
	yarn --cwd ${FRONTEND_DIR} build --output-path ${FRONTEND_OUT_DIR}

backend:
	cargo build \
 		--release \
 		--manifest-path ${BACKEND_DIR}/Cargo.toml \
 		--config env.MPDWEB_FRONTEND_OUT_DIR=\"${FRONTEND_OUT_DIR}\"

clean:
	rm -rf ${FRONTEND_OUT_DIR}
	cargo clean \
 		--manifest-path ${BACKEND_DIR}/Cargo.toml

.PHONY: all frontend backend
