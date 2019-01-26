stage 'Checkout'
 node('slave') {
  deleteDir()
  checkout scm
}

stage 'Build & Archive'
 node('slave') {
  sh './build.sh'
  step([$class: 'ArtifactArchiver', artifacts: 'app/app.jar'])
 }

stage 'Run Tests'
 node('slave') {
  sh './runtests.sh'
  publishHTML(target: [reportDir: '/', reportFiles: 'index.html', reportName: 'Testes Instrumentados'])
  step([$class: 'JUnitResultArchiver', testResults: 'results/*.xml'])
}
