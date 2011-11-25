require "spec_helper"

describe Mongoid::Configuration::Connections do

  describe ".create" do

    pending "when the options contain a hosts key"

    context "when the options contain no host key" do

      let(:options) do
        { "host" => "dev.local" }
      end

      let(:config) do
        described_class.create(options)
      end

      it "returns a single connection configuration" do
        config.should be_a(Mongoid::Configuration::Connections::Single)
      end

      it "sets the proper options" do
        config.host.should eq("dev.local")
      end
    end
  end
end
