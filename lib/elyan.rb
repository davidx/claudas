require 'date'
require 'yaml'


module Elyan
  VERSION=0.1

  def open_config_file(file)
    YAML.load(IO.read(file))
  end
  def pr_list_for_repo(repo)
    []
  end
end
