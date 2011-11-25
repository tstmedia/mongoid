require "spec_helper"

describe Mongoid::Configuration do

  before(:all) do
    Object.send(:remove_const, :Rails) if defined?(Rails)
  end

  before do
    described_class.reset
  end

  describe ".allow_dynamic_fields" do

    it "defaults to true" do
      described_class.allow_dynamic_fields.should be_true
    end
  end

  pending ".connections"
  pending ".connections="

  describe ".identity_map_enabled" do

    it "defaults to false" do
      described_class.identity_map_enabled.should be_false
    end
  end

  describe ".include_root_in_json" do

    it "defaults to false" do
      described_class.include_root_in_json.should be_false
    end
  end

  pending ".load!"

  describe ".max_retries_on_connection_failure" do

    it "defaults to 0" do
      described_class.max_retries_on_connection_failure.should eq(0)
    end
  end

  describe ".persist_in_safe_mode" do

    it "defaults to false" do
      described_class.persist_in_safe_mode.should be_false
    end
  end

  describe ".preload_models" do

    it "defaults to false" do
      described_class.preload_models.should be_false
    end
  end

  describe ".raise_not_found_error" do

    it "defaults to true" do
      described_class.raise_not_found_error.should be_true
    end
  end

  describe ".skip_version_check" do

    it "defaults to false" do
      described_class.skip_version_check.should be_false
    end
  end

  describe ".time_zone" do

    it "defaults to nil" do
      described_class.time_zone.should be_nil
    end
  end

  describe ".use_utc" do

    it "defaults to false" do
      described_class.use_utc.should be_false
    end
  end
end
