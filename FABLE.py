from bottle import *

@route('/')
def main():
	return template("templates/home.tpl")

@route('/FABLE')
def main():
	return template("templates/Fablev.0.0.02.tpl")	

@route('/Run_FABLE')
def main():
	return template("templates/Fablev.0.0.02.tpl")
	
@route('/Baseline_FABLE')
def main():
	return template("templates/FABLE_Baseline.tpl")

@route('/glossary')
def main():
	return template("templates/glossary.tpl")	
	
@route('/documentation')
def main():
	return template("templates/documentation.tpl")
	
@route('/mbm')
def main():
	return template("templates/mbm.tpl")

@route('/static/:filename#.*#')
def send_static(filename):
    return static_file(filename, root='static')

run(host='localhost', port=8080, debug = True)
