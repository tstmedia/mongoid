require "spec_helper"

describe Mongoid::Configuration::Connections::Single do

  let(:single) do
    described_class.new
  end

  before do
    described_class.reset
  end

  describe "#connect_timeout" do

    it "defaults to 10" do
      single.connect_timeout.should eq(10)
    end
  end

  describe "#host" do

    it "defaults to localhost" do
      single.host.should eq("localhost")
    end
  end

  describe "#initialize" do

    context "when provided options" do

      let(:options) do
        {
          "connect_timeout" => 5,
          "host" => "dev.local",
          "op_timeout" => 45,
          "pool_size" => 5,
          "pool_timeout" => 10.0,
          "port" => 27018,
          "safe" => true,
          "slave_ok" => true,
          "ssl" => true
        }
      end

      let(:single) do
        described_class.new(options)
      end

      it "sets the connect timeout option" do
        single.connect_timeout.should eq(5)
      end

      it "sets the host option" do
        single.host.should eq("dev.local")
      end

      it "sets the op timeout option" do
        single.op_timeout.should eq(45)
      end

      it "sets the pool size option" do
        single.pool_size.should eq(5)
      end

      it "sets the pool timeout option" do
        single.pool_timeout.should eq(10.0)
      end

      it "sets the port option" do
        single.port.should eq(27018)
      end

      it "sets the safe option" do
        single.safe.should be_true
      end

      it "sets the slave ok option" do
        single.slave_ok.should be_true
      end

      it "sets the ssl option" do
        single.ssl.should be_true
      end
    end

    context "when provided invalid options" do

      let(:options) do
        { "invalid_key" => true }
      end

      let(:single) do
        described_class.new(options)
      end

      it "raises an error" do
        expect { single }.to raise_error(Mongoid::Errors::Configuration)
      end
    end

    context "when provided nil options" do

      let(:single) do
        described_class.new(nil)
      end

      it "sets the default options" do
        single.slave_ok.should be_false
      end
    end
  end

  describe "#op_timeout" do

    it "defaults to 30" do
      single.op_timeout.should eq(30)
    end
  end

  describe "#pool_size" do

    it "defaults to 1" do
      single.pool_size.should eq(1)
    end
  end

  describe "#pool_timeout" do

    it "defaults to 5.0" do
      single.pool_timeout.should eq(5.0)
    end
  end

  describe "#port" do

    it "defaults to 27017" do
      single.port.should eq(27017)
    end
  end

  describe "#safe" do

    it "defaults to false" do
      single.safe.should be_false
    end
  end

  describe "#slave_ok" do

    it "returns false" do
      single.slave_ok.should be_false
    end
  end

  describe "#ssl" do

    it "returns false" do
      single.ssl.should be_false
    end
  end
end
