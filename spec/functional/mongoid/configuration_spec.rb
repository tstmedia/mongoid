require "spec_helper"

describe Mongoid::Configuration do

  before(:all) do
    ENV["RACK_ENV"] = "test"
    Object.send(:remove_const, :Rails) if defined?(Rails)
  end

  before do
    described_class.reset
  end

  let(:yaml) do
    "#{CONFIG}/new.yml"
  end

  describe ".allow_dynamic_fields" do

    context "when false in the mongoid.yml" do

      before do
        described_class.load!(yaml)
      end

      it "returns false" do
        described_class.allow_dynamic_fields.should be_false
      end
    end
  end

  pending ".connections"
  pending ".connections="

  describe ".identity_map_enabled" do

    context "when true in the mongoid.yml" do

      before do
        described_class.load!(yaml)
      end

      it "returns true" do
        described_class.identity_map_enabled.should be_true
      end
    end
  end

  describe ".include_root_in_json" do

    context "when true in the mongoid.yml" do

      before do
        described_class.load!(yaml)
      end

      it "returns true" do
        described_class.include_root_in_json.should be_true
      end
    end
  end

  describe ".load!" do

    context "when provided a path" do

      context "when the path is valid" do

        context "when the settings are valid" do

          pending "returns the configuration object"
        end

        context "when the a setting is invalid" do

          before do
            ENV["RACK_ENV"] = "invalid"
          end

          after do
            ENV["RACK_ENV"] = "test"
          end

          let(:config) do
            described_class.load!(yaml)
          end

          it "raises an error" do
            expect { config }.to raise_error(Mongoid::Errors::Configuration)
          end
        end
      end

      context "when the path is not valid" do

        let(:config) do
          described_class.load!("/dont/know/this/path")
        end

        it "raises an error" do
          expect { config }.to raise_error
        end
      end
    end

    context "when provided a non-path" do

      let(:config) do
        described_class.load!(145)
      end

      it "raises an error" do
        expect { config }.to raise_error
      end
    end
  end

  describe ".max_retries_on_connection_failure" do

    context "when 5 in the mongoid.yml" do

      before do
        described_class.load!(yaml)
      end

      it "returns 5" do
        described_class.max_retries_on_connection_failure.should eq(5)
      end
    end
  end

  describe ".persist_in_safe_mode" do

    context "when true in the mongoid.yml" do

      before do
        described_class.load!(yaml)
      end

      it "returns true" do
        described_class.persist_in_safe_mode.should be_false
      end
    end
  end

  describe ".preload_models" do

    context "when true in the mongoid.yml" do

      before do
        described_class.load!(yaml)
      end

      it "returns true" do
        described_class.preload_models.should be_false
      end
    end
  end

  describe ".raise_not_found_error" do

    context "when false in the mongoid.yml" do

      before do
        described_class.load!(yaml)
      end

      it "returns false" do
        described_class.raise_not_found_error.should be_false
      end
    end
  end

  describe ".skip_version_check" do

    context "when true in the mongoid.yml" do

      before do
        described_class.load!(yaml)
      end

      it "returns true" do
        described_class.skip_version_check.should be_true
      end
    end
  end

  describe ".time_zone" do

    context "when Berlin in the mongoid.yml" do

      before do
        described_class.load!(yaml)
      end

      it "returns Berlin" do
        described_class.time_zone.should eq("Berlin")
      end
    end
  end

  describe ".use_utc" do

    context "when true in the mongoid.yml" do

      before do
        described_class.load!(yaml)
      end

      it "returns true" do
        described_class.use_utc.should be_true
      end
    end
  end
end
