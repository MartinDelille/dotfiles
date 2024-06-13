# Awesome tutorial: https://makefiletutorial.com/#variables-pt-2
lib = $(shell git diff master... --name-only | head -1 | sed 's/recipes\///' | sed 's/\/.*//')
version = $(shell yq eval "(.versions | keys)[0]" ${lib}/config.yml)
folder = ${lib}/$(shell yq eval "(.versions[\"${version}\"]) | .folder" ${lib}/config.yml)
os = $(shell uname -s)
build_profile = Darwin.txt
host_profile = ${build_profile}
build = ${lib}/${version}@cci_testing/testing
#build = missing

default: create
	echo ${lib}

create:
	conan create "${folder}" --version ${version} \
		--user=cci_testing \
		--channel=testing \
		-pr:b ${build_profile} \
		-pr:h ${host_profile} \
		--build ${build}

show:
	@echo ${lib}/${version}

copy:
	@echo ${lib}/${version} | pbcopy

info:
	conan info ${lib}/${version}@ --graph kw.html

vi:
	nvim ${folder}/conanfile.py

push: default
	git push
	say push
	lcv

c:
	c ${folder}

cr:
	cr ${folder}

lint:
	yamllint --config-file ../linter/yamllint_rules.yml -f standard ${lib}/config.yml
	yamllint --config-file ../linter/yamllint_rules.yml -f standard ${folder}/conandata.yml
	PYTHONPATH=.. pylint \
			   --rcfile=../linter/pylintrc_recipe \
			   --output-format=colorized \
			   ${folder}/conanfile.py
	PYTHONPATH=.. pylint \
			   --rcfile=../linter/pylintrc_testpackage \
			   --output-format=colorized \
			   ${folder}/test_package/conanfile.py

linux_shell:
	docker run -it \
		-v ~/dev/conan/cci/recipes:/cci \
		conanio/gcc11-ubuntu16.04 \
		bash

linux:
	docker run -e CONAN_SYSREQUIRES_MODE=enabled \
		-v ~/dev/conan/cci/recipes:/cci \
		conanio/gcc11-ubuntu16.04 \
		conan create /cci/${folder} \
		--version ${version} \
		--profile /cci/Linux.txt \
		-b missing

