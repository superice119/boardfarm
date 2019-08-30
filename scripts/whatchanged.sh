new_tests () {
	foo=

	for t in `git diff $1...HEAD -U0 tests | grep -v '^-' | grep -v __class__ | sed -n 's/.*class\s\+\(.*\)(.*/\1/p' | grep -v super\(`; do
		foo="$foo $t $(git grep "^class.*($t)" | grep -v ^devices | sed -n 's/.*py:class \([^(]*\)(.*):/\1/p')"
	done

	for t in $(echo $foo | xargs -n1 | sort -u | xargs); do
		echo -n "-e $t "
	done
}

features () {
	feature=$(git show | sed -n 's/\s*Features:\s*\(.*\)$/\1/p' | tr '\n' ' ')
	if [ -n "$feature" ]; then
		echo -n "-q $feature"
	fi
}

result="$(new_tests $1)"

[ "$result" != "" ] && echo "$result"
