Here my git hooks I usually use in my projects.

Installation: move on to githooks directory, and execute following command:
./install.sh PROJECT_DIR
where is PROJECT_DIR is a root directory of your project.
The hooks are being symlinked to the folder hooks from this repository.

Requirements:
flake8 in your virtual environment|br|
csslint|br|
jshint|br|
For now hooks validate only python files, css, js files.
