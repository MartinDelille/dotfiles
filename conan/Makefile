# Awesome tutorial: https://makefiletutorial.com/#variables-pt-2
lib = $(shell git diff master... --name-only | head -1 | sed 's/recipes\///' | sed 's/\/.*//')
version = $(shell yq eval "(.versions | keys)[0]" ${lib}/config.yml)
folder = ${lib}/$(shell yq eval "(.versions[\"${version}\"]) | .folder" ${lib}/config.yml)
os = $(shell uname -s)
build_profile = ${os}.txt
host_profile = ${os}.txt
build = --build ${lib}
#build = --build missing

default: test
	echo ${lib}

install:
	echo ${lib}/${version}
	rm -rf build
	conan install ${folder} ${lib}/${version} \
		--install-folder build \
		-pr:b ${build_profile} \
		-pr:h ${host_profile} \
		${build}

export:
	rm -rf \
		${folder}/test_*/build \
		${folder}/test_*/conan.lock \
		${folder}/test_*/conanbuildinfo.txt \
		${folder}/test_*/conaninfo.txt \
		${folder}/test_*/graph_info.json
	conan export ${folder} ${lib}/${version}@

test: export
	conan test ${folder}/test_package ${lib}/${version} \
		${build} \
		-pr:b ${build_profile} \
		-pr:h ${host_profile}

testv1: export
	conan test ${folder}/test_v1_package ${lib}/${version} \
		${build} \
		-pr:b ${build_profile} \
		-pr:h ${host_profile}

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
