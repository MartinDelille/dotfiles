# Awesome tutorial: https://makefiletutorial.com/#variables-pt-2
lib = $(shell git diff master... --name-only | head -1 | sed 's/recipes\///' | sed 's/\/.*//')
version = $(shell yq eval "(.versions | keys)[0]" ${lib}/config.yml)
folder = ${lib}/$(shell yq eval "(.versions[\"${version}\"]) | .folder" ${lib}/config.yml)
#extra = --build missing
os = $(shell uname -s)

default: test
	say ${lib}

install:
	echo ${lib}/${version}
	rm -rf build
	conan install ${folder} ${lib}/${version} \
		--install-folder build \
		--profile ${os}.txt ${extra}

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
		--build ${lib} \
		--profile ${os}.txt \
		--profile:build ${os}.txt

testv1: export
	conan test ${folder}/test_v1_package ${lib}/${version} \
		--build ${lib} \
		--profile ${os}.txt \
		--profile:build ${os}.txt

show:
	@echo ${lib}/${version}

copy:
	@echo ${lib}/${version} | pbcopy

info:
	conan info ${lib}/${version}@ --graph kw.html

vi:
	vi ${folder}/conanfile.py

push: default
	git push
	lcv

c:
	c ${folder}

lint:
	PYTHONPATH=.. pylint \
			   --rcfile=../linter/pylintrc_recipe \
			   --output-format=colorized \
			   ${folder}/conanfile.py