require 'yaml'
file=File.expand_path(File.dirname(__FILE__)+"/../accreditation_form_options.yml")
ACCREDITATION_FORM_OPTIONS = YAML.load_file(file)