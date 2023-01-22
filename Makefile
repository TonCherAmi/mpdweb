FRONTEND_DIR := ${PWD}/frontend
FRONTEND_OUT_DIR := ${FRONTEND_DIR}/dist

BACKEND_DIR := ${PWD}/backend

define say_begin
@printf '\033[0;32m$(1)\033[m $(2)...'
endef

define say_done
@printf '\033[0;32mdone\033[m\n'
endef

all: frontend backend

frontend:
	@$(call say_begin,building,frontend)

	@yarn --cwd ${FRONTEND_DIR} install >/dev/null
	@yarn --cwd ${FRONTEND_DIR} build --output-path ${FRONTEND_OUT_DIR} >/dev/null

	@$(call say_done)

backend:
	@$(call say_begin,building,backend)

	@cargo --quiet build \
 		--release \
 		--manifest-path ${BACKEND_DIR}/Cargo.toml \
 		--config env.MPDWEB_FRONTEND_OUT_DIR=\"${FRONTEND_OUT_DIR}\"

	@$(call say_done)

clean:
	@$(call say_begin,cleaning,frontend)

	@rm -rf ${FRONTEND_DIR}/node_modules
	@rm -rf ${FRONTEND_OUT_DIR}

	@$(call say_done)

	@$(call say_begin,cleaning,backend)

	@cargo --quiet clean --manifest-path ${BACKEND_DIR}/Cargo.toml

	@$(call say_done)

.PHONY: all frontend backend
