
pipeline {

	agent any

	stages {
		stages('build') {
			sh 'ant -f build.xml -v'
		}
	}
}
