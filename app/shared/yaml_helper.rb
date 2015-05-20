module YamlHelper
  def yaml
    YAML.load(File.read("#{app.resource_path}/key.yml"))
  end
end