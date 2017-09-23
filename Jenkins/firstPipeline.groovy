
pipeline {

	agent any

	stages {
		stages('build') {
			steps {
			sh 'ant -f build.xml -v'
		  }
		}
	}
}
