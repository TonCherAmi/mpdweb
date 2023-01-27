FRONTEND_DIR := ${PWD}/frontend
FRONTEND_OUT_DIR := ${FRONTEND_DIR}/dist

BACKEND_DIR := ${PWD}/backend

BUILD_LOG := ${PWD}/build.log

define say_begin
@printf '\033[0;32m${1}\033[m ${2}...'
endef

define say_done
@printf '\033[0;32mdone\033[m\n'
endef

define try_build
@echo "Attempting to run command: ${1}\n---" >> ${BUILD_LOG}

@sh -c "${1}" >> ${BUILD_LOG} 2>&1; \
RESULT=$$?; \
if [ "$$RESULT" -ne 0 ]; then \
  echo "---\nCommand failed with exit code: $$RESULT" >> ${BUILD_LOG}; \
  printf '\033[0;31mfailed\033[m\n'; \
  echo see ${BUILD_LOG} for details; \
  exit "$$RESULT"; \
fi

@echo "---\nCommand succeeded" >> ${BUILD_LOG}
endef

all: frontend backend

frontend:
	@$(call say_begin,building,frontend)

	@$(call try_build,yarn --cwd ${FRONTEND_DIR} install)
	@$(call try_build,yarn --cwd ${FRONTEND_DIR} build --output-path ${FRONTEND_OUT_DIR})

	@$(call say_done)

backend:
	@$(call say_begin,building,backend)

	@$(call try_build,cargo build \
 		--release \
 		--manifest-path '${BACKEND_DIR}/Cargo.toml' \
 		--config 'env.MPDWEB_FRONTEND_OUT_DIR=\"${FRONTEND_OUT_DIR}\"')

	@$(call say_done)

clean:
	@rm ${BUILD_LOG}

	@$(call say_begin,cleaning,frontend)

	@rm -rf ${FRONTEND_DIR}/node_modules
	@rm -rf ${FRONTEND_OUT_DIR}

	@$(call say_done)

	@$(call say_begin,cleaning,backend)

	@cargo --quiet clean --manifest-path ${BACKEND_DIR}/Cargo.toml

	@$(call say_done)

.PHONY: all frontend backend
