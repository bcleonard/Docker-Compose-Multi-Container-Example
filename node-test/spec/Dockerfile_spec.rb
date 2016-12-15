require "serverspec"
require "docker"
require "spec_helper"

PORT = 80

describe "DockerFile" do
  before(:all) do
    @image = Docker::Image.build_from_dir('.')

    set :backend, :docker
    set :docker_image, @image.id

    @image.tag('repo' => 'local/node-test', 'tag' => 'latest', force: true)
  end

  describe file('/src/index.js') do
    it { should exist }
  end

  describe 'Dockerfile#config' do
    it 'should expose port 80' do
      expect(@image.json['ContainerConfig']['ExposedPorts']).to include("#{PORT}/tcp")
    end
  end

end
