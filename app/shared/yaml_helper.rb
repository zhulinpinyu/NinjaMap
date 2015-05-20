module YamlHelper
  def yaml
    YAML.load(File.read("#{App.resources_path}/key.yml"))
  end
end