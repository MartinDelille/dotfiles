# Awesome tutorial: https://makefiletutorial.com/#variables-pt-2
lib = $(shell git diff master... --name-only | head -1 | sed 's/recipes\///' | sed 's/\/.*//')
version = $(shell yq eval "(.versions | keys)[0]" ${lib}/config.yml)
folder = $(shell yq eval "(.versions[\"${version}\"]) | .folder" ${lib}/config.yml)
#extra = -b missing
os = $(shell uname -s)

default: create
	say ${lib}

create:
	conan create ${lib}/${folder} ${lib}/${version}@ --profile ${os}.txt -b ${lib}

install:
	echo ${lib}/${version}
	rm -rf build
	conan install ${lib}/${folder} ${lib}/${version} --install-folder build --profile ${os}.txt ${extra}

export:
	conan export ${lib}/${folder} ${lib}/${version}@

test: export
	conan test ${lib}/${folder}/test_package ${lib}/${version} -b ${lib} --profile ${os}.txt -pr:b ${os}.txt

testv1: export
	conan test ${lib}/${folder}/test_v1_package ${lib}/${version} -b ${lib} --profile ${os}.txt -pr:b ${os}.txt

show:
	@echo ${lib}/${version}

copy:
	@echo ${lib}/${version} | pbcopy

info:
	conan info ${lib}/${version}@ --graph kw.html

vi:
	vi ${lib}/${folder}/conanfile.py

push: test
	git push
	lcv

upload:
	conan install sentry-native/0.4.12@ -s os.version=10.13 -if build

c:
	c ${lib}/${folder}

lint:
	PYTHONPATH=.. pylint --rcfile=../linter/pylintrc_recipe --output-format=colorized ${lib}/${folder}/conanfile.py
