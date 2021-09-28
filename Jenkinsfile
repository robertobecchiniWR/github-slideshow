node {
    stage "Prepare environment"
        checkout scm
        def environment  = docker.build 'roberto-node'

        environment.inside {
			stage('Step 1') {
      			steps {
        			sh 'echo "slideshow"'
      			}
    		}
		}
}
